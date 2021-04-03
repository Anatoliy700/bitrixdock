FROM nginx:1.13

MAINTAINER vitams

ADD conf/nginx.conf /etc/nginx/
ADD conf/default.conf /etc/nginx/conf.d/
ADD conf/upstream.conf /etc/nginx/conf.d/

RUN usermod -u 1000 www-data

COPY ./ssl/cert.key /etc/nginx/ssl/cert.key
COPY ./ssl/cert.pem /etc/nginx/ssl/cert.pem

CMD ["nginx"]

EXPOSE 80 443
