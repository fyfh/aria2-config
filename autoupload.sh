#!/bin/bash
path="$3"
downloadpath='/usr/local/caddy/www/aria2/Download'
rclone='mn:'   #默认根目录下

if [ $2 -eq 0 ]
        then
                exit 0
fi

while true; do
    filepath=$path
    path=${path%/*}; 
    if [ "$path" = "$downloadpath" ] && [ $2 -eq 1 ]
        then
        rm '${filepath}.aria2'
        rclone copy -vv "${filepath}" "${rclone}"
        rm -rf "${filepath}"
        exit 0
    elif [ "$path" = "$downloadpath" ]
        then
        rm '${filepath}.aria2'
        rclone copy -vv "${filepath}" "${rclone}/${filepath#${downloadpath}/}"
        rm -rf "${filepath}"
        exit 0
    fi
done
