
AMACADDR1="3c:97:0e:22:8b:ad"
LANP1="enp0s25"

echo "display mac configure"
sudo macchanger -s enp0s25

echo "set new MAC addr $AMACADDR1 to $LANP1"
sudo macchanger -m $AMACADDR1 $LANP1

echo "display mac configure"
sudo macchanger -s enp0s25

