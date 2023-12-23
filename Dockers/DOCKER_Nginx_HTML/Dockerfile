FROM nginx
COPY index.html /usr/share/nginx/html
COPY port_config.txt /usr/share/nginx/port_config.txt
RUN export PORT=$(cat /usr/share/nginx/port_config.txt | cut -d ":" -f 2) && sed -i "s/82/$PORT/g" /etc/nginx/conf.d/default.conf
