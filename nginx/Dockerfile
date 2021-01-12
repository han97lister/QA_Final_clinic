FROM nginx:1.17.10-alpine
RUN apk add nano && apk add curl
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d
EXPOSE 80