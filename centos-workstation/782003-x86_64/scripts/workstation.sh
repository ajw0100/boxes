#!/bin/bash

set -eux

sudo yum -y groupinstall "Server with GUI"
sudo systemctl set-default graphical.target
sudo sed -i s/"daemon]$"/"daemon]\nAutomaticLoginEnable=true\nAutomaticLogin=vagrant"/ /etc/gdm/custom.conf