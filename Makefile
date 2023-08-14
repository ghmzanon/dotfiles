DOTFILES=~/.dotfiles

link:
	ln -s $(DOTFILES)/.aliases ~/.aliases
	ln -s $(DOTFILES)/.bashrc ~/.bashrc
	ln -s $(DOTFILES)/.gitconfig ~/.gitconfig
	ln -s $(DOTFILES)/.inputrc ~/.inputrc
	ln -s $(DOTFILES)/.ps1 ~/.ps1
	ln -s $(DOTFILES)/.tmux.conf ~/.tmux.conf

unlink:
	unlink ~/.aliases
	unlink ~/.bashrc
	unlink ~/.gitconfig
	unlink ~/.inputrc
	unlink ~/.ps1
	unlink ~/.tmux.conf

