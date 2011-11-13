#! /bin/bash

yourMd5=$(echo $2 | md5sum -)
yourMd5=${yourMd5:0:32}

md5=$(sed -n "$1p" md5solutions.txt)

if [[ $md5 == $yourMd5 ]]; then
    echo "Correct."
    exit 0
else
    echo "Incorrect."
    exit 1
fi
