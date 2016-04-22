FILE="sites.txt"

mkdir /usr/share/nginx/sites

while read STRING; do
        touch /etc/nginx/sites-available/$STRING
        echo "server {
        listen 80;
        root /usr/share/nginx/sites/$STRING;
        index index.php index.html index.htm;
        server_name $STRING;
      }" >> /etc/nginx/sites-available/$STRING
        mkdir /usr/share/nginx/sites/$STRING
        ln -s /etc/nginx/sites-available/$STRING /etc/nginx/sites-enabled/$STRING

        cd
        NM=$STRING
        read STRING
        wget $STRING -O archive.zip
        unzip archive.zip
        
        NEW_DIR=$(ls -dt */ | head -1| cut -d'/' -f1)
        cd $NEW_DIR
        echo SONO DENTRO $NEW_DIR
        CONT=$(docker run --rm -v "/$PWD:/src" grahamc/jekyll build)
        docker rm $CONT
        rm -r /usr/share/nginx/sites/$NM/*
        cp -r _site/* /usr/share/nginx/sites/$NM
        cd
        rm archive.zip
        rm -r $NEW_DIR
done < "$FILE"
