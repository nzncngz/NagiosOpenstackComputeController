#!/bin/sh
# Created by: odinesolutions.com
# Created Date: 6/10/2018
# Nagios nrpe plugin for openstack. This plugin checks each undercloud baremetal node and report their status
#
set -e
export OS_TENANT_NAME=admin
export OS_AUTH_URL=http://x.x.x.x:5000/v2.0
export OS_USERNAME=admin
export OS_PASSWORD=PASS_VAR
export OS_CLOUDNAME=undercloud

CMD=$(openstack baremetal node list |egrep -v "+---------|ID" |awk -F "|" '{print $7}' | grep True |wc -l)

if  [ $CMD -gt 0 ] ;
then
echo "WARNING - There are  $CMD hosts which are in maintenance true state "
exit 1
else
echo "OK - There is no  host in maintenance state"
exit 0

fi



