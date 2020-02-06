FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/*
## Copy angular output to nginx
COPY ./dist /usr/share/nginx/html

## Set the permission for NGINX web folder
RUN chmod 777 -R /usr/share/nginx/html

## Overwrite the default NGINX config
## using the custom config file
COPY ./custom-nginx-file.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]