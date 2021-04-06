
APIKEY=etnec5k9lEB9JfhsCfq7saEYOKVqd5PrRsY3Ajrcd2kVAUH8p7vVgpalamOGKD7B
NAGIOSIP=10.142.7.254
HOST=$(hostname -s)
HOST_IP=$(cat /etc/hosts | grep $HOST |grep external | awk -F ' ' '{print $1}')

if [[ $(hostname -s) =~ dir ]]; then
HOST_IP=$(cat /etc/hosts | grep $HOST | awk -F ' ' '{print $1}')
curl -XPOST "http://$NAGIOSIP/nagiosxi/api/v1/config/host?apikey=$APIKEY" -d "host_name=$HOSTNAME&address=$HOST_IP&use=xiwizard_linuxserver_host&force=1&applyconfig=1"
else
curl -XPOST "http://$NAGIOSIP/nagiosxi/api/v1/config/host?apikey=$APIKEY" -d "host_name=$HOSTNAME&address=$HOST_IP&use=xiwizard_linuxserver_host&force=1&applyconfig=1"
fi
