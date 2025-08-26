#!/bin/bash

export DOTFILES="$HOME/.dotfiles"

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mInstallation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/omarchy/install.sh"
}

trap catch_errors ERR

# Ask for app choices
# echo "Get ready to make a few choices..."
# source ~/.local/share/omakub/install/terminal/required/app-gum.sh >/dev/null
# source ~/.local/share/omakub/install/first-run-choices.sh
# source ~/.local/share/omakub/install/identification.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Installing terminal and desktop tools..."

  # Install command line tools
  source ./install/cli.sh

  # Install graphical tools and tweaks
  source ./install/gui.sh

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300

  # reboot system to make some changes take effect
  sudo systemctl reboot --now
else
  echo "Only installing terminal tools..."
  source ./install/cli.sh
fi
