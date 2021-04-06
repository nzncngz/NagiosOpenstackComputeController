
####AMQP IPs########
if [[ $(hostname -s) =~ dir ]]; then
CTLPLANEIP=$(ip -4 -o a |grep br-ctlplane | awk '{print $4}' | awk -F "/" '{print $1}')
UNDER_PASS=$(hiera admin_password)
sed -i s/x.x.x.x/$CTLPLANEIP/g nrpe.cfg
sed -i s/y.y.y.y/$CTLPLANEIP/g nrpe.cfg
sed -i s/z.z.z.z/$CTLPLANEIP/g nrpe.cfg
sed -i s/x.x.x.x/$CTLPLANEIP/g /usr/local/nagios/libexec/check_bare_maint.sh
sed -i s/PASS_VAR/$UNDER_PASS/g /usr/local/nagios/libexec/check_bare_maint.sh
else

echo "echo $HOSTNAME Configuring nrpe..."
IP_KEYSTONE_INTERNAL=$(cat /etc/hosts |grep cloud.internal | awk -F" " '{print $1}')
echo PORT5000 is $IP_KEYSTONE_INTERNAL
IP_KEYSTONE_CTLPLANE=$(cat /etc/hosts |grep cloud.ctlplane |awk -F" " '{print $1}')
echo PORT35357 is  $IP_KEYSTONE_CTLPLANE
IP_RABBIT=$(cat /etc/hosts |grep $(cat /etc/hostname | awk -F"." '{print $1}' ) |grep internalapi |awk -F" " '{print $1}')
echo RABBITMQ IP is $IP_RABBIT
sed -i s/x.x.x.x/$IP_KEYSTONE_CTLPLANE/g nrpe.cfg
sed -i s/y.y.y.y/$IP_KEYSTONE_INTERNAL/g nrpe.cfg
sed -i s/z.z.z.z/$IP_RABBIT/g nrpe.cfg


fi





#####tap bandwidth######################

ip a |grep tap | awk -F ": "  '{print $(2)}' | while read line ; do sed -i "1 i\\command[check_"$line"_bw]=/usr/local/nagios/libexec/check_bw.sh localhost linux $line 5 8000 9000 9500" nrpe.cfg ;done
ip a |grep tap | awk -F ": "  '{print $(2)}' | while read line ; do sed -i "1 i\\command[check_"$line"]=/usr/local/nagios/libexec/check_nic_stats.sh $line" nrpe.cfg ;done

###Load alarm based on core number######
CPUCOUNT=`cat /proc/cpuinfo | grep -i processor | wc -l`
if [ "$CPUCOUNT" -eq 48 ]; then
sed -i "1 i\\command[check_load]=/usr/local/nagios/libexec/check_load -w 38,38,38 -c 43,43,43" nrpe.cfg
elif [ "$CPUCOUNT" == "56" ]; then
sed -i "1 i\\command[check_load]=/usr/local/nagios/libexec/check_load -w 44,44,44 -c 50,50,50" nrpe.cfg
else
sed -i "1 i\\command[check_load]=/usr/local/nagios/libexec/check_load -w 57,57,57 -c 64,64,64" nrpe.cfg
fi
##########

/bin/cp /tmp/nrpe.cfg /usr/local/nagios/etc/nrpe.cfg

