FROM nginx:alpine
#MAINTAINER Ruben Baquedano <rubiquedano@gmail.com>

COPY website /website
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80