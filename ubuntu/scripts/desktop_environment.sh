#!/bin/sh -eux

apt-get	-y install --no-install-recommends software-properties-common xorg xinit lightdm;

add-apt-repository ppa:elementary-os/stable;
add-apt-repository ppa:elementary-os/os-patches;

apt-get -y update;
apt-get -y dist-upgrade;

apt-get	-y install elementary-theme elementary-icon-theme elementary-default-settings elementary-desktop;
