#!/bin/bash
cat /etc/snmp/snmpd.conf |egrep 'com2sec|rocommunity'|grep public
if  [ $? -eq 0 ] ; 
then
echo "CRITICAL - Please check snmpd.conf file and change the community string  "
exit 2
else 
echo "OK"
exit 0

fi
