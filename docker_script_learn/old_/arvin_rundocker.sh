#docker run --name arvin_contain -it c24e5ac76cc4 /bin/bash
echo "service start after execute below command"
echo " ssh / samba / X11-Forwarding"
#docker run --name arvin_env -p 32767:22 -e DISPLAY -h build_shmdp -v /tmp/.X11-unix:/tmp/.X11-unix -it c24e5ac76cc4 /bin/bash
#docker run --name arvin_env -p 32767:22 -e DISPLAY -h build_shmdp -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/project:/home/phil/mnt_project -it pure_env:mds400 /bin/bash

docker run --name arvin_env -e DISPLAY -h build_shmdp -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/project:/home/phil/mnt_project -it pure_env:mds400 /bin/bash

echo "remove container after stop"
docker rm arvin_env
