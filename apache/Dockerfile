FROM gendosu/alpine-apache:latest

MAINTAINER aakdev

RUN apk add --no-cache apache2-proxy; \
     apk add --no-cache apache2-ssl; \
     addgroup -g 1000 -S www; \
     adduser -G www -u 1000 -s /bin/sh -D www;

COPY conf /etc/apache2
COPY ./ssl/cert.key /etc/apache2/ssl/cert.key
COPY ./ssl/cert.pem /etc/apache2/ssl/cert.pem

EXPOSE 80 443

CMD /usr/sbin/httpd -DFOREGROUND 
