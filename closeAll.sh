#!/bin/bash

FILE="./config.txt"

while read STRING
do
	docker stop $STRING
done < "$FILE"
