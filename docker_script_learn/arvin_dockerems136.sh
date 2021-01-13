
echo "service need to start menually after system power up"
echo " ssh / samba "

# Fedora release 29 (Twenty Nine)
# NAME=Fedora
# VERSION="29 (Container Image)"
# ID=fedora
# VERSION_ID=29
# VERSION_CODENAME=""
# PLATFORM_ID="platform:f29"
# PRETTY_NAME="Fedora 29 (Container Image)"

echo " this is for EMS v1.3.6 "

# set container hostname thst will show in the command line head
CONT_HOSTNAME=ems136

# set container name
CONTAINER_NAME=container_ems136

# mapping the ssh port 22 of container to port 32768 of host
MAPPING_SSHPORT=32770:22
# mapping the samba port 139 and 445 to HOST.
MAPPING_SMBPORT1=139:139
MAPPING_SMBPORT2=445:445

# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
# fedora              29                  d09302f77cfc        4 weeks ago         275MB
# IMAGEID=94e814e2efa8
# pure_env            ems136              ded7ab3da07e        4 seconds ago       591MB
IMAGEID=ded7ab3da07e

echo ""
#map workspace or project folder in HOST(local) to container
# {HOST folder}:{container folder}
MAPPING_PROJ_PATH=~/project:/home/mnt_project
echo "workspace and project folder = $MAPPING_PROJ_PATH"
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

#xhost +local:root

docker run --name $CONTAINER_NAME \
     -h $CONT_HOSTNAME \
     -p $MAPPING_SSHPORT \
     -e DISPLAY=$DISPLAY \
     -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
     -v $MAPPING_PROJ_PATH \
     --rm \
     -it $IMAGEID \
     /bin/bash -c "cd /home/mnt_project; bash"



#     -v $HOME_PATH/.Xauthority:/root/.Xauthority:rw \                                                              
#echo "remove container after stop"
#docker rm $CONTAINER_NAME


