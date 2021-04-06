#!/bin/sh


if ! egrep -q "^10.200.247.127\s+lydia" /etc/hosts  ; then
echo "CRITICAL -  lydia is not in /etc/hosts file or the line is hashed"
exit 2
elif ! egrep -q "^10.210.173.51\s+federer" /etc/hosts  ; then
echo "CRITICAL -  federer is not in /etc/hosts file or the line is hashed"
exit 2
elif ! egrep -q "^10.210.173.50\s+nadal" /etc/hosts  ; then
echo "CRITICAL -  nadal is not in /etc/hosts file or the line is hashed"
exit 2
elif ! egrep -q "^10.210.173.210\s+sampras" /etc/hosts  ; then
echo "CRITICAL -  sampras is not in /etc/hosts file or the line is hashed"
exit 2
elif ! egrep -q "^10.201.147.204\s+hingis" /etc/hosts  ; then
echo "CRITICAL -  hingis is not in /etc/hosts file or the line is hashed"
exit 2
else 
echo "OK"
exit 0

fi
