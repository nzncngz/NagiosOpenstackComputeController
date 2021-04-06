#!/bin/bash
ovc_process_count=$(sudo /opt/OV/bin/ovc -status|grep Running|wc -l)
if [ "$ovc_process_count" -lt 7 ]
then
echo "WARNING - there is less than 7 running hpom process  "
exit 1
elif [ "$ovc_process_count" -lt 10 ]
then
echo "WARNING - there is less than 10 running hpom process"
exit 1
else 
echo "OK"
exit 0

fi
