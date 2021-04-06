#!/bin/bash
COUNT=$(cat /usr/share/openstack-tripleo-heat-templates/puppet/services/rabbitmq.yaml |grep -o "raw,6,18,<<30000:64/native>>" |wc -l)
if  [ $COUNT -ne 2 ] ;
then
echo "CRITICAL - Please change the timout value at /usr/share/openstack-tripleo-heat-templates/puppet/services/rabbitmq.yaml file , Redhat Solution 3451691"
exit 2
else
echo "OK"
exit 0

fi


