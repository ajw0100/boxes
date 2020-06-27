#!/bin/bash

set -eux

sudo dnf -y groupinstall workstation
sudo systemctl set-default graphical.target
sudo sed -i s/"daemon]$"/"daemon]\nAutomaticLoginEnable=true\nAutomaticLogin=vagrant"/ /etc/gdm/custom.conf