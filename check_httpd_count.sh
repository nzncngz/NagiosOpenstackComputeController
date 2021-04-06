#!/bin/bash
httpd_count=$(ps aux|grep httpd|wc -l)
keystone_count=$(ps aux|grep keystone|wc -l)
num=$(echo $httpd_count + $keystone_count | bc)
if  [ $num -gt 1000 ] ;
then
echo "CRITICAL - Number of httpd process exceeded the limits - $num  "
exit 2
else
echo "OK - $num | Count=$num"
exit 0

fi

