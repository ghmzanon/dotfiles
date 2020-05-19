#!/bin/bash

# Fetch and install updates
sudo apt-get update && sudo apt-get upgrade -y

# Install pretty much everything I need
sudo apt-get install \
	vim git tmux build-essential clang openjdk-11-jdk texlive-full \
	zsh curl vlc gimp qbittorrent hexchat cheese \
	gnome-tweak-tool gnome-shell-extensions \
	gnome-shell-extension-caffeine gnome-shell-pomodoro \
	openconnect network-manager-openconnect-gnome freerdp2-x11 \
	-y

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-syntax-highlighting via oh-my-zsh plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# OBS: Must exit from zsh in order to proceed

# Install Spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

# Install VSCode
curl -o vscode.deb -L https://go.microsoft.com/fwlink/\?LinkID\=760868
sudo apt-get install ./vscode.deb -y
rm -rf vscode.deb

# Install and run Android-Studio
sudo apt-get install libcanberra-gtk-module libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 -y
curl -o android-studio.tar.gz -L https://redirector.gvt1.com/edgedl/android/studio/ide-zips/3.6.3.0/android-studio-ide-192.6392135-linux.tar.gz
tar -xvf android-studio.tar.gz
sudo mv android-studio /opt
/opt/android-studio/bin/studio.sh
