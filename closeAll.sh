#!/bin/bash

FILE="./containers.txt"

while read STRING
do
	docker stop $STRING
done < "$FILE"
