#!/bin/bash

sudo dnf install -y tmux
ln -sfn $DOTFILES/config/tmux $HOME/.config/tmux
