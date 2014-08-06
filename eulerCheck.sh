#! /bin/bash

yourMd5=$(echo $2 | md5sum -)
yourMd5=${yourMd5:0:32}

md5=$(sed -n "$1p" md5solutions.txt)

echo -n "The answer \"$2\" is "
if [[ $md5 == $yourMd5 ]]; then
    echo "correct."
    exit 0
else
    echo "incorrect."
    exit 1
fi
