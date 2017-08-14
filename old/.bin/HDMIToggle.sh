#!/bin/bash

# This script just considers a computer with only one monitor and only one HDMI output
# It cycles between:
# -> both HDMI and monitor active -> just monitor active -> just HDMI active ->

# Verifies if HDMI1 is connected (but not necessarly enabled)
if [ $(xrandr | grep 'HDMI1' | awk '{print $1 $2}') == 'HDMI1connected' ]
   then
      # If notebook monitor (LVDS1) and HDMI are both enabled, disables HDMI and keeps monitor enabled
      if [ $(xrandr | grep -c '[0-9]\+x[0-9]\++[0-9]\++[0-9]\s') -gt '1' ]
      then
         xrandr --output HDMI1 --off
         pacmd set-card-profile alsa_card.pci-0000_00_1b.0 output:analog-stereo+input:analog-stereo
      # If only monitor is enabled, disables monitor and enables HDMI
      elif [ $(xrandr | grep '[0-9]\+x[0-9]\++[0-9]\++[0-9]\s' | awk '{print $1 $2}') == 'LVDS1connected' ]
      then
         xrandr --output HDMI1 --auto --output LVDS1 --off
         pacmd set-card-profile alsa_card.pci-0000_00_1b.0 output:hdmi-stereo+input:analog-stereo
      # If only HDMI is enabled, enables monitor
      elif [ $(xrandr | grep '[0-9]\+x[0-9]\++[0-9]\++[0-9]\s' | awk '{print $1 $2}') == 'HDMI1connected' ]
      then
         xrandr --output LVDS1 --auto
         pacmd set-card-profile alsa_card.pci-0000_00_1b.0 output:hdmi-stereo+input:analog-stereo
      fi
fi
