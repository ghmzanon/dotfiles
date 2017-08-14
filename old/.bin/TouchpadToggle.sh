#!/bin/bash

if [ $(synclient | grep TouchpadOff | awk '{print $3}') = '0' ]
then
   synclient TouchpadOff=1
   sudo su -c 'echo 255 >/sys/class/leds/dell-laptop::touchpad/brightness'
else
   synclient TouchpadOff=0
   sudo su -c 'echo 0 >/sys/class/leds/dell-laptop::touchpad/brightness'
fi
