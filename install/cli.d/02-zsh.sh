sudo dnf install -y zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-syntax-highlighting extension via oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# remove old bash resources
rm -rf $HOME/.bash*

# remove fresh install oh-my-zsh resources
rm -rf $HOME/.zsh*

# link config files
ln -sfn $DOTFILES/config/zsh/zshrc $HOME/.zshrc
ln -sfn $DOTFILES/config/zsh/zshrc.d $HOME/.zshrc.d
