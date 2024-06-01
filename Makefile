SHELL := /bin/bash
DOTFILES=~/.dotfiles
BACKUP=~/.backup

link:
	mkdir -p $(BACKUP)
	[ ! -f ~/.bashrc ] || mv ~/.bashrc $(BACKUP) 
	ln -s $(DOTFILES)/.bashrc ~/.bashrc
	[ ! -d ~/.bashrc.d ] || mv ~/.bashrc.d $(BACKUP) 
	ln -s $(DOTFILES)/.bashrc.d ~/.bashrc.d
	[ ! -f ~/.gitconfig ] || mv ~/.gitconfig $(BACKUP) 
	ln -s $(DOTFILES)/.gitconfig ~/.gitconfig
	[ ! -f ~/.inputrc ] || mv ~/.inputrc $(BACKUP)
	ln -s $(DOTFILES)/.inputrc ~/.inputrc
	[ ! -f ~/.tmux.conf ] || mv ~/.tmux.conf $(BACKUP)
	ln -s $(DOTFILES)/.tmux.conf ~/.tmux.conf
	source ~/.bashrc

unlink:
	[ ! -L ~/.bashrc ] || unlink ~/.bashrc
	[ ! -L ~/.bashrc.d ] || unlink ~/.bashrc.d
	[ ! -L ~/.gitconfig ] || unlink ~/.gitconfig
	[ ! -L ~/.inputrc ] || unlink ~/.inputrc
	[ ! -L ~/.tmux.conf ] || unlink ~/.tmux.conf
	mv -f $(BACKUP)/.* ~/ 2> /dev/null; true
	source ~/.bashrc
