if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root."
	exit 1
fi
clear
echo "Bridge Making Tool"
ifconfig
echo "Enter Interface Name:"
read interface

cp /etc/network/interfaces /etc/network/interfaces.bak

echo
newcontent="$newcontent\n"
newcontent="$newcontent #Making Bridge"

echo "Installing bridge-utils"
apt-get install -y bridge-utils

echo "
#Making Bridge
auto br0
iface br0 inet dhcp
        bridge_ports $interface
        bridge_fd 9
        bridge_hello 2
        bridge_maxage 12
        bridge_stp off
" >> /etc/network/interfaces

echo "Starting bridge br0"
ifup br0

echo "We've added a new bridge using! Backup is at /etc/network/interfaces.bak"