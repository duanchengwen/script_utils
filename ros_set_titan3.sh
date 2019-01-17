#!/bin/sh

bash_file=".bashrc"
hostname_file="/etc/hostname"
hosts_file="/etc/hosts"

# modify .bashrc file
cd /home/titan

exist=`cat ${bash_file} | grep tegra-ubuntu`

if [ "${exist}"x = 'x'  ]; then
    echo 'export ROS_MASTER_URI=http://tegra-ubuntu-1:11311' >> ${bash_file}
else
    sed -i 's/tegra-ubuntu-[0-9]/tegra-ubuntu-1/g' ${bash_file}
fi

# modify /etc/hostname file
read -p "please set the hostname num (1-4) :" mhostname
echo "titan3" | sudo -S echo "tegra-ubuntu-$mhostname" > ${hostname_file}

# modify /etc/hosts file
echo "127.0.0.1 localhost" > ${hosts_file}
echo "127.0.0.1 tegra-ubuntu-$mhostname" >> ${hosts_file}
echo "192.168.5.100   hy" >> ${hosts_file}
if [ $mhostname = 1 ]; then
    echo "192.168.5.102	tegra-ubuntu-2" >> ${hosts_file}
    echo "192.168.5.102	tegra-ubuntu-3" >> ${hosts_file}
    echo "192.168.5.102	tegra-ubuntu-4" >> ${hosts_file}
elif [ $mhostname = 2 ]; then
    echo "192.168.5.102	tegra-ubuntu-1" >> ${hosts_file}
    echo "192.168.5.102	tegra-ubuntu-3" >> ${hosts_file}
    echo "192.168.5.102	tegra-ubuntu-4" >> ${hosts_file}
elif [ $mhostname = 3 ]; then
    echo "192.168.5.102	tegra-ubuntu-1" >> ${hosts_file}
    echo "192.168.5.102	tegra-ubuntu-2" >> ${hosts_file}
    echo "192.168.5.102	tegra-ubuntu-4" >> ${hosts_file}
elif [ $mhostname = 4 ]; then 
    echo "192.168.5.102	tegra-ubuntu-1" >> ${hosts_file}
    echo "192.168.5.102	tegra-ubuntu-2" >> ${hosts_file}
    echo "192.168.5.102	tegra-ubuntu-3" >> ${hosts_file}
fi
