#!/bin/bash

OK=0
WARNING=1
CRITICAL=2
UNKNOWN=3

while test -n "$1"; do
    case "$1" in
        --interface|-i)
            INTERFACE=$2
            shift
            ;;
        --speed|-s)
            EXPECT_SPEED=$2
            shift
            ;;
        *)
            echo "Unknown argument: $1"
            exit $UNKNOWN
            ;;
    esac
    shift
done

if [ x == x$INTERFACE ]; then
    echo "set interface."
elif [ x == x$EXPECT_SPEED ]; then
    EXPECT_SPEED=1000
fi

CARRIER=$(cat /sys/class/net/$INTERFACE/carrier)
REAL_SPEED=$(cat /sys/class/net/$INTERFACE/speed)
DORMANT=$(cat /sys/class/net/$INTERFACE/dormant)

if [ x == x$CARRIER ]; then
    echo "CRITICAL: Something wrong with interface $INTERFACE, cable exists. "
    exit $CRITICAL
elif [ $CARRIER == 0 ]; then
    echo "CRITICAL: No link detected in interface $INTERFACE, something wrong with cable. "
    exit $CRITICAL
elif [ $REAL_SPEED -lt $EXPECT_SPEED ]; then
    echo "CRITICAL: Interface $INTERFACE link at ${REAL_SPEED}Mb/s, expected ${EXPECT_SPEED}Mb/s"
    exit $CRITICAL
else
    echo "OK: Interface $INTERFACE link at ${REAL_SPEED}Mb/s"
    exit $OK
fi

echo "UNKNOWN: Unknown state"
exit $UNKNOWN
