#!/bin/bash

dirs=(`find ./src/* -name "*.json"`)
count=0

for dir in "${dirs[@]}"
do
    echo 'Parsing: ' $dir
    y=$(jq . $dir)
    if ["$y" == ""]; then
        echo "Error Occured"
        exit 255
    fi
    count=`expr $count + 1`
done

echo 'JSONs processed: '$count
