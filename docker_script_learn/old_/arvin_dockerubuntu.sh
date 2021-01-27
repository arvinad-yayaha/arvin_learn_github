
echo "service need to start menually after system power up"
echo " ssh / samba "

# DISTRIB_ID=Ubuntu
# DISTRIB_RELEASE=18.04
# DISTRIB_CODENAME=bionic
# DISTRIB_DESCRIPTION="Ubuntu 18.04.2 LTS"

echo " this is Ubuntu 18.04.2 LTS "

# set container hostname thst will show in the command line head
PROJ_NAME=ubuntu1804

# set container name
CONTAINER_NAME=container_ubuntu

# mapping the ssh port 22 of container to port 32768 of host
MAPPING_SSHPORT=32769:22
# mapping the samba port 139 and 445 to HOST.
MAPPING_SMBPORT1=139:139
MAPPING_SMBPORT2=445:445

# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
# ubuntu              v18.04.2LTS         94e814e2efa8        3 weeks ago         88.9MB
# IMAGEID=94e814e2efa8
# ubuntu1804          editor              9a8a207e1a60        16 hours ago        1.01GB
IMAGEID=9a8a207e1a60

#docker run --name $CONTAINER_NAME -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -it $IMAGEID /bin/bash
#docker run --name $CONTAINER_NAME -p $MAPPING_SSHPORT -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -it $IMAGEID /bin/bash

docker run --name $CONTAINER_NAME \
     --rm \
     -p $MAPPING_SSHPORT \
     -e DISPLAY \
     -h $PROJ_NAME \
     -v /tmp/.X11-unix:/tmp/.X11-unix \
     -v ~/project:/home/mnt_project \
     -it $IMAGEID /bin/bash -c "service ssh start; bash"



#     -v $HOME/.Xauthority:/home/froot/.Xauthority \
#echo "remove container after stop"
#docker rm $CONTAINER_NAME


