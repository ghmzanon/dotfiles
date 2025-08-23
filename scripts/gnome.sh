#!/bin/bash

# center new windows in the middle of the screen
gsettings set org.gnome.mutter center-new-windows true

# Set Cascadia Mono as the default monospace font
# gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaMono Nerd Font 10'

# reveal week numbers in the Gnome calendar
gsettings set org.gnome.desktop.calendar show-weekdate true

# turn off ambient sensors for setting screen brightness (they rarely work well!)
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false

# alt+F4 is very cumbersome
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"

# use only one workspace instead of dynamic mode
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1

# theming
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# turn-off animations
gsettings set org.gnome.desktop.interface enable-animations false

# navigation
gsettings set org.gnome.mutter overlay-key ''
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.shell.window-switcher current-workspace-only true
gsettings set org.gnome.shell.window-switcher app-icon-mode 'app-icon-only'
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>Space']"
gsettings set org.gnome.shell enabled-extensions "[
	'caffeine@patapon.info'
]"
# gsettings set org.gnome.desktop.wm.keybindings toggle-above "[]"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>Return']"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Alt>F10']"

# privacy
gsettings set org.gnome.desktop.privacy hide-identity true
gsettings set org.gnome.desktop.privacy old-files-age 15
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.desktop.privacy remember-app-usage false
gsettings set org.gnome.desktop.privacy report-technical-problems false
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true

# search
gsettings set org.gnome.desktop.search-providers disable-external true

# interface
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface enable-hot-corners false

# set the favorite apps
gsettings set org.gnome.shell favorite-apps "[
	'Alacritty.desktop',
	'org.mozilla.firefox.desktop',
	'org.gnome.Nautilus.desktop',
	'Activity.desktop'
]"

