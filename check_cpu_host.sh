
# Calculate average cpu usage per core.
#      user  nice system   idle iowait irq softirq steal guest guest_nice
# cpu0 30404 2382   6277 554768   6061   0      19    0      0          0
A=($(grep $1 /proc/stat))
# user         + nice     + system   + idle
B0=$((${A[1]}  + ${A[2]}  + ${A[3]}  + ${A[4]}))
sleep 2
# user         + nice     + system   + idle
C=($(grep $1 /proc/stat))
D0=$((${C[1]}  + ${C[2]}  + ${C[3]}  + ${C[4]}))
# cpu usage per core
E0=$(echo "scale=1; (100 * ($B0 - $D0 - ${A[4]}   + ${C[4]})  / ($B0 - $D0))" | bc)

if (( $(echo "$E0 > 99" |bc -l) )); 
then
echo "CRITICAL - One of the host core cpu utilization hit to %100  "
else
echo "OK - $E0 | Count=$E0"
exit 0

fi

