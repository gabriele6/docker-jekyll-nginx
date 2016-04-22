
#!/bin/bash

FILE="./containers.txt"

while read STRING
do
	docker start $STRING
done < "$FILE"
