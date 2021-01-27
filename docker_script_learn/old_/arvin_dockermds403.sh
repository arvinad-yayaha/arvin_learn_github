# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
# mds400              shmdp               c24e5ac76cc4        7 weeks ago         21.4GB

echo "service start after execute below command"
echo " ssh / samba / X11-Forwarding"

echo " this is for sledgehammer "
# set container hostname thst will show in the command line head
PROJ_NAME=build_mds403
# set container name
CONTAINER_NAME=container_mds403
# mapping the ssh port 22 of container to port 32768 of host
MAPPING_PORT=32768:22
IMAGEID=476e2b94618a

#docker run --name $CONTAINER_NAME -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -it $IMAGEID /bin/bash
#docker run --name $CONTAINER_NAME -p $MAPPING_PORT -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -it $IMAGEID /bin/bash

docker run --name $CONTAINER_NAME -p $MAPPING_PORT -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/project:/home/mnt_project -it $IMAGEID /bin/bash

#echo "remove container after stop"
#docker rm $CONTAINER_NAME


