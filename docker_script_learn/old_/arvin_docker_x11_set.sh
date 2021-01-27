#
# for x11 forwarding. this script is executed in the docker:
# 
xauth generate :0 . trusted
export DISPLAY=:0

