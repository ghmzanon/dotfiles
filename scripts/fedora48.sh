#!/bin/bash

# remove gnome bloat from fedora
sudo dnf remove -y \
	gnome-contacts \
	gnome-clocks \
	gnome-maps \
	gnome-software \
	gnome-tour \
	gnome-weather \
	evince \ # replaced by papers in gnome 49
	totem # replaced by showtime in gnome 49

# install applications
sudo dnf install -y papers showtime

# post-install cleanup
sudo dnf autoremove

