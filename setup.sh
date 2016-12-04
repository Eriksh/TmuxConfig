#!/bin/bash
#This script automatically downloads &
#configures tmux.ls
#
#Created by Erik Hall

#Ensure the script is being run as root
if ! [ $(id -u)=0 ]; then
	echo 'This script must be run as root'
	exit
fi

#Save current working directory & filename
cwd=$(pwd)
file="$cwd/setup.sh"

#Download tmux
pacman -S tmux --noconfirm

#Download configuration file into home directory & rename
sleep 10s
wget https://raw.githubusercontent.com/Eriksh/TmuxConfig/master/tmux.conf
sleep 10s
mv -f tmux.conf ~/.tmux.conf

#Confirm file was downloaded & renamed
if [ -f ~/.tmux.conf ]; then
	echo "Removing $file from system..."
	rm -f $file && echo 'Installation & configuration completed!' || echo "Failed to remove $file"

else
	echo 'Was unable to find ~/.tmux.conf, please verify tmux.conf was downloaded into your home direcory.'
fi
