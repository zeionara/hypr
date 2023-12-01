#!/bin/bash

sleep 1

killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal
logger 'killed all xdg-desktop'

sleep 1
# /usr/lib/xdg-desktop-portal-hyprland -v >> /home/cait/xdgh-log.txt 2>&1 &
# /usr/lib/xdg-desktop-portal-hyprland &
/usr/libexec/xdg-desktop-portal-hyprland &
# /usr/libexec/xdg-desktop-portal-wlr -l TRACE >> /home/cait/xdpw-log.txt 2>&1 &
logger 'xdg-desktop-portal-hyprland started'

sleep 2
/usr/libexec/xdg-desktop-portal &
logger 'xdg-desktop-portal started'
