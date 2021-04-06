#!/bin/bash
ovs_packets_count=`sudo ovs-appctl dpctl/show --statistics | grep -A 2 $1  | grep $2 |sed 's/.*packets:\(.*\) err.*/\1/'`
if [[ $2 == "RX" ]]
then
ovs_errors_count=`sudo ovs-appctl dpctl/show --statistics | grep -A 2 $1 | grep $2 |sed  's/.*errors:\(.*\) dropped.*/\1/'`
else
ovs_errors_count=`sudo ovs-appctl dpctl/show --statistics | grep -A 2 $1 | grep $2 |sed  's/.*errors:\(.*\) dropped.*/\1/'`
fi
ovs_errors_perc=$(echo "scale=4; $ovs_errors_count/$ovs_packets_count" |bc )
echo "Percentage - $ovs_errors_perc Count - $ovs_errors_count | Count=$ovs_errors_count"
exit 0

fi

