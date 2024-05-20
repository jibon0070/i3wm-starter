#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
	echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
	exit 1
fi

username=$(id -u -n 1000)

apt install nala
nala install i3 polybar rofi feh alacritty picom variety -y

if [ ! -d /home/$username/.config ]; then
	mkdir -p /home/$username/.config
fi

cp config/* /home/$username/.config -R
chown $username:$username /home/$username/.config -R

exit 0
