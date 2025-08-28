#!/bin/bash

# Run graphical installers
for installer in ./gui.d/*.sh; do source $installer; done

