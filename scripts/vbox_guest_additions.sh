#!/bin/bash

set -e
set -x

sudo aptitude -y install build-essential
sudo aptitude -y install bzip2
sudo aptitude -y install dkms
sudo aptitude -y install linux-vyatta-kbuild

sudo ln -s /usr/src/linux-image/debian/build/build-amd64-none-amd64-vyos "/lib/modules/$(uname -r)/build"

sudo mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/
yes | sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f ~/VBoxGuestAdditions.iso