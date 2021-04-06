
#!/bin/bash
IP=$(cat /etc/hosts |grep $(cat /etc/hostname | awk -F"." '{print $1}' ) |grep internalapi |awk -F" " '{print $1}')
curl -X TRACE $IP/dashboard  2>&1|grep 405
if  [ $? -ne 0 ] ;
then
echo "CRITICAL - Please ensure that TRACE method is disallowed  "
exit 2
else
echo "OK"
exit 0

fi

