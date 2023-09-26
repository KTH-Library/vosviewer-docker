# syntax=docker/dockerfile:1.4
FROM node:latest as build
COPY VOSviewer-Online /src
WORKDIR /src
RUN npm install
RUN npm run build

FROM nginx
COPY --from=build /src/dist/vosviewer-online /usr/share/nginx/html/vosviewer
#RUN cd /usr/share/nginx/html && cp -r vosviewer/images images
