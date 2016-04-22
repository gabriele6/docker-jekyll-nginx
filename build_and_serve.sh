#!/bin/bash

FILE="containers.txt"
NEW_DIRECTORY="personal"

# halting and deleting the obsolete containers
# NOTE: do not edit "containers.txt". Otherwise the script might not halt the old containers and the updated files won't be built
while read STRING; do
	docker stop $STRING
	docker rm $STRING
done < "$FILE"

rm ./$FILE

cd

# building and serving with jekyll (assuming port 80 is free to use)
docker run -d -v "/$PWD/$NEW_DIRECTORY:/src" -p 80:4000 grahamc/jekyll serve -H 0.0.0.0 >> $FILE

docker run -d -p 8080:80 alexwhen/docker-2048 >> $FILE

echo ""
echo ""
echo "DONE!"
