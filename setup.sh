#!/bin/bash

root="$HOME/.config/hypr"
config="$root/hyprland.conf"

if test -f "$config"; then
    mv "$config" "$config.old"
fi

mv "$HOME/hypr/hyprland.conf" $config
ln $config "$HOME/hypr/hyprland.conf"
