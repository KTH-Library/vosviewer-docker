#! make

build-init:
	test -d VOSviewer-Online || git clone --depth=1 https://github.com/neesjanvaneck/VOSviewer-Online.git && \
		cd VOSviewer-Online && \
			sed -i "s|publicPath: env.dev ? '/' : undefined,|publicPath: env.dev ? '/vosviewer/' : undefined,|g" webpack.config.babel.js && \
			sed -i "s|to: absolute('dist', bundleName, 'images/|to: absolute('dist', bundleName, 'vosviewer-online/images/|g" webpack.config.babel.js && \
			cp -r data ..

build:
	docker build -t vosviewer .

test:
	@docker compose up -d
	@sleep 3
	@echo "$$(curl -s localhost:8080/vosviewer/ | grep -oP VOSviewer | uniq)" | grep -q "VOSviewer" && echo "It works!"
	@docker compose down

	@echo "Please run \ndocker compose up\n ... and go to ...\n \
		http://localhost:8080/vosviewer/?json=data/JOI_2007-2016_co-authorship_network.json&simple_ui=true"

browse:
	@docker compose up -d
	firefox http://localhost:8080/vosviewer/?map=data/JOI_2007-2016_co-authorship_map.txt&network=data/JOI_2007-2016_co-authorship_network.txt&simple_ui=true

clean:
	@docker compose down
	rm -rf VOSviewer-Online
