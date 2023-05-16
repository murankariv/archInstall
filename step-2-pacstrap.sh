#!/usr/bash


# This script builds the very base system so it can be chrooted to complete the initial system.  This process follows the Arch way.
# The only packages being install are the bare minimum linux kernel. intel-ucode can be swapped for amd-ucode.  vim can be swapped for nano

# The following Options are taken from the pacstrap wiki
# OPTIONS

#-C <config> Use an alternate config file for pacman.

#-c Use the package cache on the host, rather than the target.

#-D Skip pacman dependency checks.

#-G Avoid copying the host’s pacman keyring to the target.

#-i Prompt for package confirmation when needed (run interactively).

#-K Initialize an empty pacman keyring in the target (implies -G).

#-M Avoid copying the host’s mirrorlist to the target.

#-N Run in unshare mode. This will use unshare(1) to create a new mount and user namespace, allowing regular users to create new system installations.

#-P Copy the host’s pacman config to the target.

#-U Use pacman -U to install packages. Useful for obtaining fine-grained control over the installed packages.

#-h Output syntax and command line options.

$ pacstrap  -K /mnt base base-devel linux linux-headers linux-lts linux-lts-headers linux-firmware intel-ucode vim reflector rsync openssh inetutils
$ genfstab -U /mnt >> /mnt/fstab
