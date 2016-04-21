#!/bin/bash

docker run -d -p 8080:80 alexwhen/docker-2048 > $FILE

FILE="./config.txt"
PROFILE="gabriele6" # your GitHub profile
REPO="gabriele6.github.io" # the name of the repository you want to dockerize
BRANCH="master"
NEW_DIRECTORY="personal"

# halting and deleting the obsolete containers
# NOTE: do not edit "config.txt". Otherwise the script might not halt the old containers and the updated files won't be built
while read STRING; do
	docker stop $STRING
	docker rm $STRING
done < "$FILE"

cd

# deleting old content in the obsolete directory
rm -r $NEW_DIRECTORY

# downloading and extracting the updated jekyll files
wget "https://github.com/$PROFILE/$REPO/archive/$BRANCH.zip"
unzip "$BRANCH.zip"
rm "$BRANCH.zip"
mv "$REPO-$BRANCH" ./$NEW_DIRECTORY

# building and serving with jekyll (assuming this is being run as root and port 80 is free to use)
docker run -d -v "/root/$NEW_DIRECTORY:/src" -p 80:4000 grahamc/jekyll serve -H 0.0.0.0 >> $FILE

echo ""
echo ""
echo "DONE!"