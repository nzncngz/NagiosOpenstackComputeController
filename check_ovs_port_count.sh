#!/bin/bash
port_count=$(sudo ovs-dpctl show |grep port | grep tap |wc -l)

if  [ $1 -ne $port_count ] ;
then
echo "CRITICAL - Number of ovs port count for this node should be - $1 , the current ovs port number is $port_count  "
exit 2
else
echo "OK - $port_count"
exit 0

fi

