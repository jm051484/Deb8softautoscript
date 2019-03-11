# !/bin/bash
#
# -------------------------------------------------------
# Softether Auto Install Script
# For Debian 8
#
# Script Modded by jm051484
#
#
# Script Based from tutorial by lincolin.hk
#
# Good Luck!
# -------------------------------------------------------
# Updating Repositories and Installing Development Packages
apt-get update
apt-get install build-essential -y
# Get the Softether Packages via wget and Save it into /root
cd /root
wget http://www.softether-download.com/files/softether/v4.10-9473-beta-2014.07.12-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.10-9473-beta-2014.07.12-linux-x64-64bit.tar.gz
tar zxf softether-vpnserver-v4.10-9473-beta-2014.07.12-linux-x64-64bit.tar.gz
# Making files, manual input needed
cd vpnserver
clear
make
cd ..
# Moving files to /usr/local
mv vpnserver /usr/local
# Set the permissions
cd /usr/local/vpnserver
chmod 600 *
chmod 700 vpncmd
chmod 700 vpnserver
# Downloading the Scripts for init.d and set Permission
cd /root
wget https://raw.githubusercontent.com/jm051484/Deb8softautoscript/master/vpnserver-debian.sh --no-check-certificate
mv vpnserver-debian.sh /etc/init.d/vpnserver
cd /etc/init.d
chmod 755 vpnserver
# Creating lock and last touching...
mkdir /var/lock/subsys
update-rc.d vpnserver defaults
/etc/init.d/vpnserver start
cd /usr/local/vpnserver
echo -----------------------------------------------------
echo Install finish!
echo check this step to check are installer is working properly
echo 1. vpnserver and vpncmd is on /usr/local/vpnserver
echo 2. /etc/init.d/vpnserver start can executed
echo if vpnserver can start, congratulations!
echo ------------------------------------------------------
exit
