# modify on 2020/10/07
echo "service start after execute below command"
echo " ssh / samba/ X11-Forwarding"

echo " this is for openbmc "
echo ""
# set container hostname that will show in the command line head
# inside the container
CONT_HOSTNAME=openbmc
# set container name show up on "docker ps -l"
CONTAINER_NAME=conobmc

# mapping the ssh port 22 of container to port 32769 of host
MAPPING_SSHPORT=32769:22
echo " set ssh port mapping " 
echo " ----------  (host):(container) => $MAPPING_SSHPORT"

# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
# ubuntu              18.04               72300a873c2c        2 weeks ago         64.2MB
# obmc                ubu1804             3f59266c4926        22 seconds ago      884MB
IMAGEID=obmc:ubu1804

echo ""
#map workspace or project folder in HOST(local) to container
# {HOST folder}:{container folder}
MAPPING_PROJ_PATH=/home/froot/project:/home/mnt_project
echo " set workspace folder mapping "
echo " ---------  (host):(container) => $MAPPING_PROJ_PATH"

echo ""
HOME_PATH=$HOME
echo "home folder = $HOME_PATH"

echo ""
if [ -z $MAPPING_PROJ_PATH  ]
then
	echo "Please set the project or workspace path in the script"
	exit -1
fi

if [ -z $HOME_PATH  ]
then
	echo "Please set the home path in the script"
	exit -1
fi


#docker run --name $CONTAINER_NAME -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -it $IMAGEID /bin/bash
#docker run --name $CONTAINER_NAME -p $MAPPING_SSHPORT -e DISPLAY -h $PROJ_NAME -v /tmp/.X11-unix:/tmp/.X11-unix -it $IMAGEID /bin/bash

xhost +local:root

docker run --name $CONTAINER_NAME \
     -h $CONT_HOSTNAME \
     -p $MAPPING_SSHPORT \
     -e DISPLAY=$DISPLAY \
     -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
     -v $MAPPING_PROJ_PATH \
     -it $IMAGEID \
     /bin/bash -c "service ssh start; cd /home/mnt_project; bash"

#     --rm \
#     -v $HOME_PATH/.Xauthority:/root/.Xauthority:rw \
#     -dt $IMAGEID /bin/bash -c "service ssh start; bash"
#     -it $IMAGEID /bin/bash -c "sudo /home/mnt_project/AMILTS12p1/mds1201/MDS --clean; bash"
#     -v $HOME/.Xauthority:/home/froot/.Xauthority:rw \
#echo "remove container after stop"
#docker rm $CONTAINER_NAME
#docker start -i [container id]




