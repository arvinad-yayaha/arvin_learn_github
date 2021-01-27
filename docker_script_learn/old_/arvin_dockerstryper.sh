
# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
# pure_env            stryper             1776bff254e6        2 months ago        2.32GB


echo "service start after execute below command"
echo " ssh / samba / X11-Forwarding"

echo " this is for tryper "
# set container hostname thst will show in the command line head
PROJ_NAME=build_stryper
# set container name
CONTAINER_NAME=container_stryper
# mapping the ssh port 22 of container to port 32767 of host
MAPPING_PORT=35123:22
IMAGEID=1776bff254e6

#docker run --name $CONTAINER_NAME -p $MAPPING_PORT -h $PROJ_NAME -it $IMAGEID /bin/bash

#docker run --name $CONTAINER_NAME -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -it $IMAGEID /bin/bash

#docker run --name $CONTAINER_NAME -p $MAPPING_PORT -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -it $IMAGEID /bin/bash

docker run --name $CONTAINER_NAME -p $MAPPING_PORT -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/project:/home/phil/mnt_project -it $IMAGEID /bin/bash

echo "remove container after stop"
docker rm $CONTAINER_NAME
