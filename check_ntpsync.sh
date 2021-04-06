
#!/bin/bash
ntpstat
if  [ $? -ne 0 ] ;
then
echo "ntp is not sync"
exit 1
else
echo "OK"
exit 0

fi

