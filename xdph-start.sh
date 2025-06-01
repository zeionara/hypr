#!/usr/bin/env bash
sleep 1
killall -e xdg-desktop-portal-hyprland
killall xdg-desktop-portal
killall xdg-desktop-portal-wlr
/usr/lib/xdg-desktop-portal-hyprland -v > /home/zeio/xdph.log.txt &2>1 &
# /usr/libexec/xdg-desktop-portal-wlr > /home/zeio/xdpw.log.txt &2>1 &
sleep 2
/usr/libexec/xdg-desktop-portal > /home/zeio/xdp.log.txt &2>1 &
