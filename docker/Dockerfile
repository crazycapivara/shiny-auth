FROM nginx:alpine

LABEL maintainer="<crazycapivara@gmail.com>"

COPY ./config/shiny.conf /etc/nginx/conf.d/

COPY ./config/nginx_pwd /etc/nginx/.htpasswd

EXPOSE 8090

CMD ["nginx", "-g", "daemon off;"]

