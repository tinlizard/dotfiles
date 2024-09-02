#!/bin/bash
#check if ~/.config exists and copy config files to ~/.config
if [ -d "~/.config" ]; then
	cp -r ./*/ ~/.config
else 
	mkdir ~/.config
	cp -r ./*/ ~/.config
fi

#check if ~/.xinitrc exists and copy config files to ~/.xinitrc
if [ -f "~/.xinitrc" ]; then
	cp .xinitrc ~/.xinitrc
else 
	touch ~/.xinitrc
	cp .xinitrc ~/.xinitrc
fi

#install stuff if not installed
programs=(picom rofi sway i3 polybar fuzzel)
for program in "${programs[@]}"; do
	if command -v "$program" &> /dev/null; then
		echo "$program is already installed, proceeding to next program..."
	else
		echo "$program is not installed. Installing..."
		if [ $1 = 'arch']; then
			sudo pacman -S "$program"
		elif [ $1 = 'void']; then
			sudo xbps-install "$program"
		elif [ $1 = 'debian' ] || [ $1='ubuntu' ] || [ $1 = 'mint' ]; then
			sudo apt install "$program"
		elif [ $1 = 'gentoo' ]; then
			sudo emerge --ask "$program"
		else 
			echo "Unsupported linux distro. Try installing manually, or editing 
			this shell script."
		fi 
	fi
done
