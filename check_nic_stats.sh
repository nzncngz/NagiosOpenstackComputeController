#!/bin/bash
collisions_1=`cat /sys/class/net/$1/statistics/collisions`
rx_dropped_1=`cat /sys/class/net/$1/statistics/rx_dropped`
rx_errors_1=`cat /sys/class/net/$1/statistics/rx_errors`
rx_over_errors_1=`cat /sys/class/net/$1/statistics/rx_over_errors`
tx_dropped_1=`cat /sys/class/net/$1/statistics/tx_dropped`
tx_errors_1=`cat /sys/class/net/$1/statistics/tx_errors`

echo " rx_dropped - $rx_dropped_1 , rx_errors - $rx_errors_1  , rx_over_errors - $rx_over_errors_1 collision - $collisions_1 , tx_dropped - $tx_dropped_1 , tx_errors - $tx_errors_1 | collisions=$collisions_1 , rx_dropped=$rx_dropped_1 , rx_errors=$rx_errors_1 ,rx_over_errors=$rx_over_errors_1 , tx_dropped=$tx_dropped_1 , tx_errors=$tx_errors_1"
exit 0
