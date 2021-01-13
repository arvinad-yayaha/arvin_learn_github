# this script is used to run the container orderly
# modified on 2019/02/11
# execute "sudo bash start_container.sh"
#
echo "in HOST"
echo "stop samba service"
service smbd stop

docker container ls -a
GATEWAY_CONTAINID=d2ee479694bd
echo "gateway container id $GATEWAY_CONTAINID"
docker container start $GATEWAY_CONTAINID
docker exec $GATEWAY_CONTAINID service ssh start
docker exec $GATEWAY_CONTAINID service smbd start
docker exec $GATEWAY_CONTAINID ifconfig

SLED_CONTAINID=fbf08c8e19a2
echo "sledge hammer container id $SLED_CONTAINID" 
docker container start $SLED_CONTAINID
docker exec $SLED_CONTAINID service ssh start
docker exec $SLED_CONTAINID service smbd start
docker exec $SLED_CONTAINID ifconfig

STRYPER_CONTAINID=2cc282b8b17c
echo "stryper container id $STRYPER_CONTAINID"
docker container start $STRYPER_CONTAINID
docker exec $STRYPER_CONTAINID service ssh start
docker exec $STRYPER_CONTAINID service samba start
docker exec $STRYPER_CONTAINID ifconfig


echo "mount other samba to gateway"
docker exec -it -u luke $GATEWAY_CONTAINID sudo bash /home/connected.sh
docker exec -it -u luke $GATEWAY_CONTAINID df -h

docker container ls -a



echo "END of process"
