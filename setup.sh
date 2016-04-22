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
	
	NEW_DIR=$(ls -Art | tail -n 1)
	rm archive.zip
	cd $NEW_DIR
	
	CONT=$(docker run -d -v "/$PWD/$NEW_DIRECTORY:/src" grahamc/jekyll build)
	docker rm $CONT
	cp -r _site/* /usr/share/nginx/sites/$NM
	cd 
	rm -r $NEW_DIR
done < "$FILE"