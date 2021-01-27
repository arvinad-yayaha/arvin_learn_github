#!/bin/sh

#ie CANNAE_SRC="/home/xxx02/projects/aws_repo/wmw-psc-fw-d9f5/"
CANNAE_SRC="/home/kid03/BMC_Code/Kroran"
# ie HOME_PATH="/home/xxx02"
HOME_PATH="/home/kid03"
# ie MDS_WORKSPACE_PATH="/home/xxx02/projects/mds_workspaces/4.0.1/"
MDS_WORKSPACE_PATH="/home/kid03/workspace_docker"

if [ -z $CANNAE_SRC  ]
then
	echo "Please set the src path in the script"
	exit -1
fi

if [ -z $HOME_PATH  ]
then
	echo "Please set the home path in the script"
	exit -1
fi
xhost +local:root

docker run -it --rm \
-e DISPLAY=$DISPLAY \
-v $HOME_PATH/.Xauthority:/root/.Xauthority:rw \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v $MDS_WORKSPACE_PATH:/workspace \
-v $CANNAE_SRC:/spx \
mds:4.0.1 \
/bin/bash -c " \
cp /spx/source/WMW_PSC_FW/ddf/*.* /usr/mds-4.0.1/ddf/; \
/bin/bash
"

