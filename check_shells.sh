#!/bin/bash
ls -lrt /usr/bin/ksh |grep /bin/sh
ksh_status=$?
ls -lrt /sbin/sh |grep /bin/sh
sh_status=$?
if  [ $ksh_status -ne 0 ] ; 
then
echo "WARNING - Please check if /usr/bin/ksh is linked to /bin/sh  "
exit 1
elif [ $sh_status -ne 0 ] ;
then
echo "WARNING - Please check if /sin/sh is linked to /bin/sh  "
exit 1
elif ! egrep -q "^/usr/bin/ksh" /etc/shells  ; then
echo "WARNING - Please check if /usr/bin/ksh is added to /etc/shells file"
else 
echo "OK"
exit 0

fi
