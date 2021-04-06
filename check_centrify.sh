#!/bin/bash
usercount=$(adquery user |grep ksh |wc -l)
if  [ $usercount -eq 0 ] ; 
then
echo "WARNING - Please check Centrify configuration"
exit 1
else 
echo "OK,number of retrieved users $usercount"
exit 0

fi
