#!/bin/bash
metering_count=$(sudo rabbitmqctl list_queues | grep metering |awk -F" " '{print $(NF)}')
if  [ $? -eq 0 ] ;
then
echo "metering count $metering_count | Count=$metering_count"
exit 0
else
echo "can not read the ouput" 
exit 1
fi
