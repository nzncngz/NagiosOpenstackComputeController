#!/bin/bash
ovs_packets_count=`sudo ovs-appctl dpctl/show --statistics | grep -A 2 $1  | grep $2 |sed 's/.packets:\(.\) err.*/\1/'`
if [[ $2 == "RX" ]]
then
echo "wrong parameter"
else
ovs_aborted_count=`sudo ovs-appctl dpctl/show --statistics | grep -A 2 $1 | grep $2 |sed  's/.*aborted:\(.*\) carrier.*/\1/'`
fi
ovs_aborted_perc=$(echo "scale=4; $ovs_aborted_count/$ovs_packets_count" |bc )
echo "Percentage - $ovs_aborted_perc Count - $ovs_aborted_count  | Count=$ovs_aborted_count"
exit 0

fi

