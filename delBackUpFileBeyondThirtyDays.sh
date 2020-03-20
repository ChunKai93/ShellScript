#!/bin/bash
default="/files/php/newwcjs/backup_file/"

for i in `ls $default`
do
    #这里有一个坑，-d前面的空格不能少
    if [ -d "$default$i/default" ];then
        find $default$i/default -mtime +30 -delete
    fi
done
