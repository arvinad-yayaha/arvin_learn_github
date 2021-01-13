
echo "service start after execute below command"
echo " ssh / samba/ X11-Forwarding"

echo " this is for MDS 12.0.1 "
# set container hostname thst will show in the command line head
CONT_HOSTNAME=mds1201
# set container name show up on "docker ps -l"
CONTAINER_NAME=container_mds1201
# mapping the ssh port 22 of container to port 32768 of host
MAPPING_SSHPORT=32768:22
# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
# pure_env            mds1201             ff210bcacbb0        2 seconds ago       1.84GB
IMAGEID=ff210bcacbb0

echo ""
#map workspace or project folder in HOST(local) to container
# {HOST folder}:{container folder}
MAPPING_PROJ_PATH=~/project:/home/mnt_project
echo "set workspace folder - (host):(container) => $MAPPING_PROJ_PATH"
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
     --rm \
     -it $IMAGEID \
     /bin/bash -c "service ssh start; cd /home/mnt_project; bash"

#     -v $HOME_PATH/.Xauthority:/root/.Xauthority:rw \
#     -dt $IMAGEID /bin/bash -c "service ssh start; bash"
#     -it $IMAGEID /bin/bash -c "sudo /home/mnt_project/AMILTS12p1/mds1201/MDS --clean; bash"
#     -v $HOME/.Xauthority:/home/froot/.Xauthority:rw \
#echo "remove container after stop"
#docker rm $CONTAINER_NAME


