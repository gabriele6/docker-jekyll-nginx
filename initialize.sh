#!/bin/bash

FILE="./config.txt"
PROFILE="your_GitHub_profile"
REPO="repository_name"
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

# building and serving with jekyll (assuming port 80 is free to use)
docker run -d -v "/$PWD/$NEW_DIRECTORY:/src" -p 80:4000 grahamc/jekyll serve -H 0.0.0.0 >> $FILE

echo ""
echo ""
echo "DONE!"
