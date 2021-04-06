<<<<<<< HEAD
#!/bin/bash
STATE=$(sudo docker exec ceph-mon-gbuceph01 ceph --cluster ceph health)
=======
STATE=$(sudo docker exec ceph-mon-souceph01 ceph --cluster ceph health)
>>>>>>> 838ca64286289935b2d383ba94395d960be9ea90
if [[ $STATE == "HEALTH_OK" ]]
then
echo "Cluster Health : OK"
exit 0
else
echo "Check Ceph Cluster!"
exit 2
fi
