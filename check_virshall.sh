#!/bin/bash
sudo /usr/bin/virsh list --all | grep instance |grep -v running
if [ $? -eq 0 ]; then
instance=$(sudo /usr/bin/virsh list --all | grep instance |grep -v running)
echo "CRITICAL - VM instance $instance"
exit 2
else
echo "OK"
exit 0

fi

