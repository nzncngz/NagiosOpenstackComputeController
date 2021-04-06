#!/bin/bash

ovs_packets_count=`sudo ovs-appctl dpctl/show --statistics | grep -A 2 $1  | grep $2 |sed 's/.*packets:\(.*\) err.*/\1/'`
if [[ $2 == "RX" ]]
then
  ovs_drop_count=`sudo ovs-appctl dpctl/show --statistics | grep -A 2 $1  | grep $2 |  sed  's/.*dropped:\(.*\) over.*/\1/'`
else
  ovs_drop_count=`sudo ovs-appctl dpctl/show --statistics | grep -A 2 $1  | grep $2 |  sed  's/.*dropped:\(.*\) ab.*/\1/'`
fi

ovs_drop_perc=$(echo "scale=4; $ovs_drop_count/$ovs_packets_count" |bc )

echo "Drop Percentage - $ovs_drop_perc Dropped Packages - $ovs_drop_count | Count=$ovs_drop_count"
exit 0

fi
