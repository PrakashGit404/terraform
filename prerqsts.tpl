#!/bin/bash

#check for root
UID=$(id -u)
if [ x$UID != x0 ] 
then
    #Beware of how you compose the command
    printf -v cmd_str '%q ' "$0" "$@"
    exec sudo su -c "$cmd_str"
fi

cd /home/root/
wget -O AppsOne_5.0.5.tar.gz [URL]

for f in *.tar.gz
do
  tar zxvf "$f" 
done

ssh-keygen -t rsa -N "" -f my.key

for ip in `cat /home/list_of_servers`; do
    ssh-copy-id -i my.key.pub $ip
done
