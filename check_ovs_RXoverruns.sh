#!/bin/bash
ovs_packets_count=`sudo ovs-appctl dpctl/show --statistics | grep -A 2 $1  | grep $2 |sed 's/.packets:\(.\) err.*/\1/'`
if [[ $2 == "RX" ]]
then
ovs_overrun_count=`sudo ovs-appctl dpctl/show --statistics | grep -A 2 $1 | grep $2 |sed  's/.*overruns:\(.*\) fr.*/\1/'`
else
echo wrong parameter
fi
ovs_overrun_perc=$(echo "scale=4; $ovs_overrun_count/$ovs_packets_count" |bc )
echo "Percentage - $ovs_overrun_perc Count - $ovs_overrun_count | Count=$ovs_overrun_count"
exit 0

fi

