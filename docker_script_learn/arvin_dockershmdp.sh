# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
# mds400              shmdp               c24e5ac76cc4        7 weeks ago         21.4GB

echo "service start after execute below command"
echo " ssh / samba / X11-Forwarding"

echo " this is for sledgehammer "
# set container hostname thst will show in the command line head
PROJ_NAME=build_shmdp
# set container name
CONTAINER_NAME=container_shmdp
# mapping the ssh port 22 of container to port 32767 of host
MAPPING_PORT=32767:22
IMAGEID=c24e5ac76cc4

#docker run --name $CONTAINER_NAME -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -it $IMAGEID /bin/bash
#docker run --name $CONTAINER_NAME -p $MAPPING_PORT -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -it $IMAGEID /bin/bash

docker run --name $CONTAINER_NAME -p $MAPPING_PORT -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/project:/home/phil/mnt_project -it $IMAGEID /bin/bash
echo "remove container after stop"
docker rm $CONTAINER_NAME
