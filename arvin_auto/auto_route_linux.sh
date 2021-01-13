# run on linux script

echo "execute -- $0 $@"
echo "there are $# parameter"
echo ""

ARVOPTION1="peanuts"
ARVOPTION2="cubicle1"
ARVOPTION3="SUT192"
ARVOPTIONHELP="help"
# 0 means not match
flag_MATCH=0

function fun_aaarrvhelp
{
  if [ "$1" == "NOPARA" ]; then
     echo "**** it needs option / parameter !!!!"
  fi
  if [ 0 == "$flag_MATCH" ]; then
     echo "**** wrong parameter !!!!"
  fi
  echo ""
  echo "menu for option"
  echo "=== options 1: $ARVOPTION1"
  echo "       script.sh $ARVOPTION1"
  echo "=== options 2: $ARVOPTION2"
  echo "       script.sh $ARVOPTION2"
  echo "=== options 3: $ARVOPTION3"
  echo "       script.sh $ARVOPTION3"
  echo "=== options help: $ARVOPTIONHELP"
  echo "       script.sh $ARVOPTIONHELP"

}

if [ "$1" == "" ]; then
  flag_MATCH=1
  fun_aaarrvhelp 'NOPARA'
  exit 0
fi
if [ "$1" == "$ARVOPTIONHELP" ]; then
  flag_MATCH=1
  fun_aaarrvhelp
  exit 0
fi

if [ "$1" == "$ARVOPTION1" ]; then
  # setting config
  AGATEWAY="10.57.184.1"
  LANP1="enp0s25"
  flag_MATCH=1

  echo ""
  echo "before change"
  echo ""
  route -n
  echo ""
  echo "delete default(0.0.0.0) / gw $AGATEWAY"
  sudo route del -net default gw $AGATEWAY

  # when the iphone share internet via WIFI.
  # there is no need to added because it is exist.
  # sudo route add -net default netmask 0.0.0.0 gw 172.20.10.1 metric 600 dev wlp3s0
  
  echo "== gw is $AGATEWAY for $1 Getway"
  sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw $AGATEWAY metric 100 dev $LANP1
  
  echo ""
  echo "after change"
  echo ""
  route -n
  
  exit 0
fi


if [ "$1" == "$ARVOPTION2" ]; then
  # setting config
  AGATEWAY="10.32.8.1"
  WIFINAME="wlx90f652e3d4e8"
  LANP1="enp2s0"
  flag_MATCH=1

  echo ""
  echo "before change"
  echo ""
  route -n
  echo ""
  echo "delete default(0.0.0.0) for $AGATEWAY"
  sudo route del -net default gw $AGATEWAY

  # when share internet via WIFI.
  # there is no need to added because it is exist.
  # sudo route add -net default netmask 0.0.0.0 gw 172.20.10.1 metric 600 dev wlp3s0
  
  echo "== gw is $AGATEWAY for $1 Getway"
  sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw $AGATEWAY metric 100 dev $LANP1
  
  echo ""
  echo "after change"
  echo ""
  route -n
  
  exit 0
fi


if [ "$1" == "$ARVOPTION3" ]; then
  # setting config
  AGATEWAY="192.168.0.1"
  WIFINAME="wlp3s0"
  LANP1="enp0s25"
  flag_MATCH=1

  echo ""
  echo "before change"
  echo ""
  route -n
  echo ""
  echo "delete default(0.0.0.0) for $AGATEWAY"
  sudo route del -net default gw $AGATEWAY

  # when share internet via WIFI.
  # there is no need to added because it is exist.
  # sudo route add -net default netmask 0.0.0.0 gw 172.20.10.1 metric 600 dev wlp3s0
  
  echo "== gw is $AGATEWAY for $1 Getway"
  sudo route add -net 192.0.0.0 netmask 255.0.0.0 gw $AGATEWAY metric 100 dev $LANP1
  
  echo ""
  echo "after change"
  echo ""
  route -n
  
  exit 0
fi

fun_aaarrvhelp

