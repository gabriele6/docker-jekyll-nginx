
#!/bin/bash

FILE="./config.txt"

while read STRING
do
	docker start $STRING
done < "$FILE"
