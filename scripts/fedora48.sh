#!/bin/bash

# remove gnome bloat from fedora
sudo dnf remove -y \
	evince \ # replaced by papers in gnome 49
	gnome-contacts \
	gnome-clocks \
	gnome-maps \
	gnome-software \
	gnome-tour \
	gnome-weather \
	rhythmbox \
	totem # use good old vlc instead

# install applications
sudo dnf install -y papers

# post-install cleanup
sudo dnf autoremove

