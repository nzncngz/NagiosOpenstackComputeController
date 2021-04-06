#!/bin/bash
sema_count=$(ipcs -s | grep "^0x" |wc -l)
if [ "$sema_count" -gt 110 ]
then
echo "CRITICAL - There are $sema_count arrays | Count=$sema_count  "
exit 2
elif [ "$sema_count" -gt 100 ]
then
echo "WARNING - there are $sema_count arrays |Count=$sema_count"
exit 1
else 
echo "OK there are $sema_count arrays |Count=$sema_count"
exit 0

fi
