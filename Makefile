SHELL := /bin/bash
DOTFILES=~/.dotfiles
BACKUP=~/.backup
CONFIG=~/.config

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
	source ~/.bashrc

unlink:
	[ ! -L ~/.bashrc ] || unlink ~/.bashrc
	[ ! -L ~/.bashrc.d ] || unlink ~/.bashrc.d
	[ ! -L ~/.inputrc ] || unlink ~/.inputrc
	[ ! -L ~/.gitconfig ] || unlink ~/.gitconfig
	[ ! -L $(CONFIG)/tmux ] || unlink $(CONFIG)/tmux
	mv -f $(BACKUP)/.* ~/ 2> /dev/null; true
	source ~/.bashrc
