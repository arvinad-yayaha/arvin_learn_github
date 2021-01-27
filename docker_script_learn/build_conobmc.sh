# aaarrv/YaYaHa - 2021/01/27
#
# execute bitbake to build openbmc target.
# 

CONTAINER_NAME=conobmc

# working directory and source code path
SRC_ROOT_PATH=/home/mnt_project/openbmc/obmc_nuvoton_20201209

# for openbmc TEMPLATECONF
ARV_TARGETCONF=./meta-aaarrv/meta-aaarrv-npcm750/conf/

# modifyed the recipe for build in this variable
ARV_BUILD_TARGET=obmc-phosphor-image

# what command will be executed in container via /bin/bash
ARV_EXEC="\
     . openbmc-env; \
     bitbake $ARV_BUILD_TARGET; \
     "

# == command start to execute 
# start the container
sudo docker start $SRC_ROOT_PATH 

# below would not be modify.
sudo docker exec \
     -e LANG=en_US.UTF-8 \
     -e LC_ALL=en_US.UTF-8 \
     -e TEMPLATECONF=$ARV_TARGETCONF \
     -it \
     -u froot \
     -w $SRC_ROOT_PATH \
     $CONTAINER_NAME \
     /bin/bash -c "$ARV_EXEC"

# stop the container
sudo docker stop $SRC_ROOT_PATH


