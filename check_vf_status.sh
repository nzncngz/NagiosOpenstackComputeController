
#!/bin/bash
ip link show | grep vf |grep auto | grep "trust on"
if  [ $? -ne 0 ] ;
then
echo "link state or trust mode is not set on at least one of the VF"
exit 2
else
echo "OK all VFs link state and trust mode are set"
exit 0

fi

