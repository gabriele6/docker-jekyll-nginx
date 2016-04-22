#!/bin/bash

FILE="./containers.txt"
PROFILE="arkadianriver" # the profile name of the Jekyll theme's creator
REPO="spectral" # the repository name of the theme you want to use
BRANCH="master"
NEW_DIRECTORY="personal"

# halting and deleting the obsolete containers
# NOTE: do not edit "config.txt". Otherwise the script might not halt the old containers and the updated files won't be built
while read STRING; do
	docker stop $STRING
	docker rm $STRING
done < "$FILE"

rm ./$FILE

cd

# deleting old content in the obsolete directory
rm -r $NEW_DIRECTORY

# downloading and extracting the updated jekyll files
wget "https://github.com/$PROFILE/$REPO/archive/$BRANCH.zip"
unzip "$BRANCH.zip"
rm "$BRANCH.zip"
mv "$REPO-$BRANCH" ./$NEW_DIRECTORY

./build_and_serve.sh
