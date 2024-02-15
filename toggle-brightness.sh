#!/bin/bash

MIN_BRIGHTNESS=0
DEFAULT_BRIGHTNESS=11970

BRIGHTNESS_PATH=/sys/class/backlight/intel_backlight/brightness
BRIGHTNESS_CACHE=$HOME/brightness

if [[ $(cat $BRIGHTNESS_PATH) -eq $MIN_BRIGHTNESS ]]; then
  if test -f "$BRIGHTNESS_CACHE"; then
    sudo bash -c "cp $BRIGHTNESS_CACHE $BRIGHTNESS_PATH"
  else
    sudo bash -c "echo $DEFAULT_BRIGHTNESS > $BRIGHTNESS_PATH"
  fi
else
  cp "$BRIGHTNESS_PATH" "$BRIGHTNESS_CACHE"
  sudo bash -c "echo $MIN_BRIGHTNESS > $BRIGHTNESS_PATH"
fi
