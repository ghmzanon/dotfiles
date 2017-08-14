#!/bin/bash

if [[ $(xset q | grep "DPMS is Enabled") ]]
then
   xset -dpms; xset s off
else
   xset +dpms; xset s on
fi
