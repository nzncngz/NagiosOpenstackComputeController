#!/bin/bash

tps=$(sar -d| tail -2 |head -1 |awk '{print ($3)}')
echo "10 min tps avg $tps | Count=$tps"
exit 0
 


