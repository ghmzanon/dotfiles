#!/bin/bash

# Remove unnecessary packages
sudo apt-get remove mousepad gnome-sudoku gnome-mines sgt-puzzles pidgin transmission-gtk transmission-common xfburn atril parole

# Install daily-use packages
sudo apt-get install tmux vim git zsh build-essential arc-theme mupdf qbittorrent vlc torbrowser-launcher gimp texlive-full

# Install Oh-My-Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install Zsh-Syntax-Highlight plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install base16 colors for Xfce4-Terminal
mkdir -p ~/.local/share/xfce4/terminal
git clone https://github.com/afg984/base16-xfce4-terminal.git
mv base16-xfce4-terminal/colorschemes/ ~/.local/share/xfce4/terminal
rm -rf base16-xfce4-terminal

# Install base16 colors for Shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Clone dotfiles repository
git clone https://ghmzanon@bitbucket.org/ghmzanon/dotfiles.git
