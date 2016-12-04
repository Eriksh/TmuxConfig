#!/bin/bash
#This script automatically downloads &
#configures tmux.ls
#
#Created by Erik Hall

#Save current working directory & filename
cwd=$(pwd)
file="$cwd/setup.sh"

#Download tmux
sudo pacman -S tmux --noconfirm

#Download configuration file into home directory & rename
wget https://raw.githubusercontent.com/Eriksh/TmuxConfig/master/tmux.conf
mv tmux.conf $HOME/.tmux.conf

#Confirm file was downloaded & renamed
if [ -f ~/.tmux.conf ]; then
	echo "Removing $file from system..."
	rm -f $file && echo 'Installation & configuration completed!' || echo "Failed to remove $file"

else
	echo 'Was unable to find ~/.tmux.conf, please verify tmux.conf was downloaded into your home direcory.'
fi

