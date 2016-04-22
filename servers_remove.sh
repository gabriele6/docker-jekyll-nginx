#!/bin/bash

FILE="./domains.txt"

while read SITE; do
	rm -r /usr/share/nginx/sites/$SITE
    rm -r /etc/nginx/sites-available/$SITE /etc/nginx/sites-enabled/$SITE
done < "$FILE"

sudo service nginx restart
