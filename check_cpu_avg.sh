#!/bin/bash
if [[ $1 == "total" ]]
then
    idle=$(sar | tail -2 |head -1 |awk '{print ($8)}')
    usage=$(echo "scale = 2; 100 - $idle" | bc)
  if (( $(echo "$usage > 90" |bc -l) ));
  then
    echo "CRITICAL - 10 min cpu utilization avg $usage | count=$usage"
    exit 2
  else 
    echo "OK - 10 min cpu utilization avg $usage | Count=$usage"
    exit 0
  fi

else

    idle=$(sar -P $1| tail -2 |head -1 |awk '{print ($8)}')
    usage=$(echo "scale = 2; 100 - $idle" | bc)

  if (( $(echo "$usage > 90" |bc -l) ));
  then
    echo "CRITICAL - 10 min cpu utilization avg  $usage | count=$usage"
    exit 2
  else
    echo "OK - 10 min cpu utilization avg $usage | Count=$usage"
    exit 0
  fi

fi

