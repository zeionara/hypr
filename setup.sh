#!/bin/bash

set -e

root="$HOME/.config/hypr"
config="$root/hyprland.conf"

if test ! -d "$root"; then
  mkdir -p "$root"
fi

if test -f "$config"; then
  mv "$config" "$config.old"
fi

ln "$HOME/hypr/hyprland.conf" "$config"
