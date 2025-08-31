# remove old bash resources
unlink $HOME/.bashrc
unlink $HOME/.bashrc.d
rm -rf $HOME/.bash*

# link config files
ln -sfn $DOTFILES/config/bash/bashrc $HOME/.bashrc
ln -sfn $DOTFILES/config/bash/bashrc.d $HOME/.bashrc.d

