#!/bin/bash

FILE="./domains.txt"

mkdir /usr/share/nginx/sites

while read SITE; do
	touch /etc/nginx/sites-available/$SITE
	echo "server {
        listen 80;

        root /usr/share/nginx/sites/$SITE;
        index index.php index.html index.htm;

        server_name $SITE;

        location / {
            try_files \$uri \$uri/ =404;
        }

        location ~ \.php$ {
            try_files \$uri =404;
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass unix:/var/run/php5-fpm-site1.sock;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
            include fastcgi_params;
        }
    }" >> /etc/nginx/sites-available/$SITE
    mkdir /usr/share/nginx/sites/$SITE
    ln -s /etc/nginx/sites-available/$SITE /etc/nginx/sites-enabled/$SITE

done < "$FILE"

sudo service nginx restart
