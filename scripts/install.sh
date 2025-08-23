#!/bin/bash

# remove gnome bloat from fedora
sudo dnf remove -y \
	evince \ # replaced by papers in gnome 49
	gnome-contacts \
	gnome-clocks \
	gnome-maps \
	gnome-software \
	gnome-tour \
	gnome-weather \
	totem # replaced by showtime in gnome 49

# install applications
sudo dnf install -y \
	alacritty \
	btop \
	curl \
	git \
	gnome-shell-extension-caffeine \
	make \
	nvim \
	papers \
	tmux \
	stow \
	showtime \
	zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-syntax-highlighting extension via oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# remove old bash resources
rm -rf ~/.bash*

# remove fresh oh-my-zsh resources
rm -rf ~/.zsh*

git clone https://github.com/ghmzanon/dotfiles.git ~/.dotfiles

cd ~/.dotfiles

make all

# post-install cleanup
sudo dnf autoremove

# reboot to make some changes take effect
sudo systemctl reboot --now
