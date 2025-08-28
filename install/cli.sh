#!/bin/bash

# Needed for all installers
sudo dnf update -y
sudo dnf upgrade -y
sudo dnf install -y curl git unzip

# Run command line installers
for installer in ./cli.d/*.sh; do source $installer; done

