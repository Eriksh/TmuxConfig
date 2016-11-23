#!/bin/bash
#This script automatically downloads &
#configures tmux.

#Ensure the script is being run as root
if($USER != 'root')
  then
	echo 'This script must be run as root'
	exit
fi

#Save current working directory & filename
cwd = $(pwd)
fn = 'tmuxConfig.sh'

#Download tmux
pacman -S tmux --noconfirm

#Download configuration file into home directory & rename
cd ~
wget https://raw.githubusercontent.com/Eriksh/LinuxConfig-Scripts/Tmux-Configured/master/tmux.conf
mv -f tmux.conf ~/.tmux.conf

#Confirm file was downloaded & renamed
if(-f ~/.tmux.conf)
	then
	echo 'Removing tmuxConfig.sh from system...'
	rm -f $cwd/$fn
	echo 'Installation & configuration completed!'
else
	echo 'Was unable to find ~/.tmux.conf, please verify tmux.conf was downloaded into your home direcory.'
fi

