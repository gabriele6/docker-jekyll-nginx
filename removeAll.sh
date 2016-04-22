#!/bin/bash

FILE="./config.txt"

while read STRING
do
	docker stop $STRING
	docker rm $STRING
done < "$FILE"

rm ./config.txt
