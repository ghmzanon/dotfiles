SHELL := /bin/bash
DOTFILES=~/.dotfiles
BACKUP=~/.backup

link:
	mkdir -p $(BACKUP)
	[ ! -f ~/.aliases ] || mv ~/.aliases $(BACKUP) 
	ln -s $(DOTFILES)/.aliases ~/.aliases
	[ ! -f ~/.bashrc ] || mv ~/.bashrc $(BACKUP) 
	ln -s $(DOTFILES)/.bashrc ~/.bashrc
	[ ! -f ~/.gitconfig ] || mv ~/.gitconfig $(BACKUP) 
	ln -s $(DOTFILES)/.gitconfig ~/.gitconfig
	[ ! -f ~/.inputrc ] || mv ~/.inputrc $(BACKUP)
	ln -s $(DOTFILES)/.inputrc ~/.inputrc
	[ ! -f ~/.ps1 ] || mv ~/.ps1 $(BACKUP) 
	ln -s $(DOTFILES)/.ps1 ~/.ps1
	[ ! -f ~/.tmux.conf ] || mv ~/.tmux.conf $(BACKUP)
	ln -s $(DOTFILES)/.tmux.conf ~/.tmux.conf
	source ~/.bashrc

unlink:
	[ ! -L ~/.aliases ] || unlink ~/.aliases
	[ ! -L ~/.bashrc ] || unlink ~/.bashrc
	[ ! -L ~/.gitconfig ] || unlink ~/.gitconfig
	[ ! -L ~/.inputrc ] || unlink ~/.inputrc
	[ ! -L ~/.ps1 ] || unlink ~/.ps1
	[ ! -L ~/.tmux.conf ] || unlink ~/.tmux.conf
	mv -f $(BACKUP)/.* ~/ 2> /dev/null; true
	source ~/.bashrc
