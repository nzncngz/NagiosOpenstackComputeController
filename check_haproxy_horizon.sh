
#!/bin/bash
cat haproxy.cfg | grep -A14 horizon | grep ctr |awk '{print $6}' | uniq -d |grep ctr
if  [ $? -eq 0 ] ;
then
echo "Please check horizon configuration at haproxy.cfg file"
exit 1
else
echo "OK"
exit 0

fi

