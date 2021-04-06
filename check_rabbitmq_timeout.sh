#!/bin/bash
COUNT=$(cat /etc/rabbitmq/rabbitmq-env.conf |grep -o "raw,6,18,<<30000:64/native>>" |wc -l)
if  [ $COUNT -ne 2 ] ;
then
echo "CRITICAL - RabbitMQ timeout should be set to 30000ms , Redhat Solution #3451691 "
exit 2
else
echo "OK"
exit 0

fi

