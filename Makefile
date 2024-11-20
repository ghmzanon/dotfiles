.PHONY: home config-cli config-gui

all: home config-cli config-gui

cli: home config-cli

gui: home config-gui

remove-all: remove-home remove-config-cli remove-config-gui

remove-cli: remove-home remove-config-cli

remove-gui: remove-home remove-config-gui

home:
	stow home -t ~/

config-cli:
	stow config-cli -t ~/.config

config-gui:
	stow config-gui -t ~/.config

remove-home:
	stow -D home -t ~/

remove-config-cli:
	stow -D config-cli -t ~/.config

remove-config-gui:
	stow -D config-gui -t ~/.config
