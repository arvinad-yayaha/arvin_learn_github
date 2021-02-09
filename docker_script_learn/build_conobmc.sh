# aaarrv/YaYaHa - 2021/02/09
#
# execute bitbake to build openbmc target.
# 


ARVENVFILE="arv_menu_env_obmc.txt"
if [ ! -e "./$ARVENVFILE" ]; then
  echo "./$ARVENVFILE did not exist"
  exit 0
fi

source "$ARVENVFILE"

# === parameter for execute docker ====

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
if [ $flag_o3 == "1" ]; then
ARV_EXEC="\
     . openbmc-env; \
     bash; \
     "
fi

# ===================================

# == command start to execute 

if [ $flag_o3 == "1" ]; then

if [ $flag_o1 != "1" ]; then
  echo "start the container"
  sudo docker start $CONTAINER_NAME
fi

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

if [ $flag_o1 != "1" ]; then
  echo "stop the container"
  sudo docker stop $CONTAINER_NAME 
fi

fi



# ==== END of FILE ====

