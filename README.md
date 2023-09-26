# vosviewer-docker

A packaging of VOSviewer-Online as a container

## Screenshot

![](vosviewer-docker-screenshot.png)

## Usage

Clone or fork this repo. Then use `docker compose up -d` and go to <http://localhost:8080/vosviewer/>.

Parameters [should be used, see here... section about parameters for opening a network](https://app.vosviewer.com/docs/sharing/linking/).

Examples:

- <http://localhost:8080/vosviewer/?map=data/JOI_2007-2016_co-authorship_map.txt&network=data/JOI_2007-2016_co-authorship_network.txt&simple_ui=true>
- <http://localhost:8080/vosviewer/?json=data/JOI_2007-2016_co-authorship_network.json&simple_ui=true>

## Development

Required tools are `git`, `make`, `sed` and `docker` or `podman`.

Use the `Makefile` to build, test and run services locally.


