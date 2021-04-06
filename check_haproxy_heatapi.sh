
#!/bin/bash
cat /etc/haproxy/haproxy.cfg | grep -A11 heat_api |grep timeout | grep 20m
if  [ $? -ne 0 ] ;
then
echo "Please check heat_api configuration at haproxy.cfg file"
exit 1
else
echo "OK"
exit 0

fi

