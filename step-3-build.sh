#!/usr/bash

# This is step 3 in the process.  This script will install the needed componenets to boot a working system.
# Once the script is done the configuration needs to be completed prior to rebooting.

arch-chroot
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc --utc
reflector –country US –latest 5 –sort rate –save /etc/pacman.d/mirrorlist
pacman -Syy

pacman -S --needed - < packages.txt
