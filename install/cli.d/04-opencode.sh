#!/bin/bash

# install opencode via official installer
curl -fsSL https://opencode.ai/install | bash

# link config files
mkdir -p $HOME/.config/opencode
ln -sfn $DOTFILES/config/opencode/opencode.json $HOME/.config/opencode/opencode.json
