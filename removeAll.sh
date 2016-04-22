#!/bin/bash

FILE="./containers.txt"

while read STRING
do
	docker stop $STRING
	docker rm $STRING
done < "$FILE"

rm ./config.txt
