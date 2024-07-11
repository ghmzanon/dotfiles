SHELL := /bin/bash
DOTFILES=~/.dotfiles
HOME_BACKUP=~/.backup
CONFIG=~/.config
CONFIG_BACKUP=$(CONFIG)/.backup


link:
	mkdir -p $(BACKUP)
	[ ! -f ~/.bashrc ] || mv ~/.bashrc $(BACKUP) 
	ln -s $(DOTFILES)/bash/bashrc ~/.bashrc
	[ ! -d ~/.bashrc.d ] || mv ~/.bashrc.d $(BACKUP) 
	ln -s $(DOTFILES)/bash/bashrc.d ~/.bashrc.d
	[ ! -f ~/.inputrc ] || mv ~/.inputrc $(BACKUP)
	ln -s $(DOTFILES)/bash/inputrc ~/.inputrc
	[ ! -f ~/.gitconfig ] || mv ~/.gitconfig $(BACKUP) 
	ln -s $(DOTFILES)/git/gitconfig ~/.gitconfig
	[ ! -d $(CONFIG)/tmux ] || mv $(CONFIG)/tmux $(BACKUP)
	ln -s $(DOTFILES)/tmux $(CONFIG)/tmux
	[ ! -d $(CONFIG)/alacritty] || mv $(CONFIG)/alacritty $(CONFIG_BACKUP)
	ln -s $(DOTFILES)/alacritty $(CONFIG)/alacritty
	source ~/.bashrc

unlink:
	[ ! -L ~/.bashrc ] || unlink ~/.bashrc
	[ ! -L ~/.bashrc.d ] || unlink ~/.bashrc.d
	[ ! -L ~/.inputrc ] || unlink ~/.inputrc
	[ ! -L ~/.gitconfig ] || unlink ~/.gitconfig
	[ ! -L $(CONFIG)/tmux ] || unlink $(CONFIG)/tmux
	[ ! -L $(CONFIG)/alacritty] || unlink $(CONFIG)/alacritty
	mv -f $(HOME_BACKUP)/.* ~/ 2> /dev/null; true
	mv -f $(CONFIG_BACKUP)/.* $(CONFIG) 2> /dev/null; true
	source ~/.bashrc
