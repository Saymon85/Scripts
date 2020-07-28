#!/bin/sh

INPUT=/home/vsftpd/sw/spisak.txt
OLDIFS=$IFS
IFS=","
[ ! -f $INPUT ] &while read tip ime ip
do 
 
 [ ! -d "/backup/tftpboot/$tip/$ime" ] && mkdir -p -m 777 /backup/tftpboot/$tip/$ime
 /home/vsftpd/sw/$tip.sh $ip $tip $ime

k=$( ls -l /backup/tftpboot/$tip/$ime | wc -l )
   
if [ "$k" -gt 15 ] 
then
/bin/find /backup/tftpboot/$tip/$ime/*  -type f -mtime +14 -delete  
fi

   
done < $INPUT
IFS=$OLDIFS

rm -f /home/vsftpd/sw/kontrola.txt
ls /backup/tftpboot/*/*/ >> /home/vsftpd/sw/kontrola.txt








  
