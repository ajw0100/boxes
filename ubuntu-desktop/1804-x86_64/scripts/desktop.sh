#!/bin/bash

set -eux

apt-get install -y ubuntu-desktop --option=Dpkg::Options::=--force-confdef

mkdir -p $(dirname /etc/gdm3/custom.conf)
> /etc/gdm3/custom.conf
echo "[daemon]" >> /etc/gdm3/custom.conf
echo "# Enabling automatic login" >> /etc/gdm3/custom.conf
echo "AutomaticLoginEnable = true" >> /etc/gdm3/custom.conf
echo "AutomaticLogin = vagrant" >> /etc/gdm3/custom.conf

echo "[Desktop Entry]" >> /etc/xdg/autostart/nodpms.desktop
echo "Type=Application" >> /etc/xdg/autostart/nodpms.desktop
echo "Exec=xset -dpms s off s noblank s 0 0 s noexpose" >> /etc/xdg/autostart/nodpms.desktop
echo "Hidden=false" >> /etc/xdg/autostart/nodpms.desktop
echo "NoDisplay=false" >> /etc/xdg/autostart/nodpms.desktop
echo "X-GNOME-Autostart-enabled=true" >> /etc/xdg/autostart/nodpms.desktop
echo "Name[en_US]=nodpms" >> /etc/xdg/autostart/nodpms.desktop
echo "Name=nodpms" >> /etc/xdg/autostart/nodpms.desktop
echo "Comment[en_US]=" >> /etc/xdg/autostart/nodpms.desktop
echo "Comment=" >> /etc/xdg/autostart/nodpms.desktop
