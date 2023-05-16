#!/usr/bash

# The block of commands for gdisk needs to be completed prior to runnung this script
# You will need the disk partioned already.
#
# This script will build a btrfs hard disk with a boot partion setup up for UEFI.
#  When completed you will have a root volume of @ and 3 subvolumes of @home @var and @.snapshots


# $ gdisk /dev/sda
# N, <enter>, +300M, ef00,c,BOOT
# N,<enter>,<enter>,<enter>,c,ROOT
# w

# creates the file system for UEFI of Fat 32 on /dev/sda1
mkfs.fat -F32 -n BOOT /dev/sda1

# Creates the btrfs filesystem on the second partiton of /dev/sda2
mkfs.btrfs -L ROOT /dev/sda2

# mounts /dev/sda2 for the  initial setup of btrfs
mount /dev/sda2 /mnt
cd /mnt

# Creates the initial btrfs volume and subvolumes and unmounts /dev/sda2
btrfs su cr @
btrfs su cr @/mnt/@home
btrfs su cr @/mnt/@var
btrfs su cr @/mnt/@snapshots
umount /mnt

# Mounts the newly created btrfs file sytem for installation
# Mount options can be changed if you no what you are doing.  compression can be alterd to suite your needs.
# Any changes made needs to be replicated into the other mounts.

# Mounts the root volume
mount -o noatime,compress=zstd:1,space_cache=v2,ssd,subvol=@ /dev/sda3 /mnt

# creates the other directoies that are need into mnt
# -p with {} allows for multiple directories to be created in one command
#  Snapshots can be made hidden by adding a period (.snapshots).  If the change is made it needs to
# be replicated for all the commands regarding snapshots (i.e. @.snapshots ) /mnt/.snapshots
mkdir -p /mn/{boot/efi,home,var,snapshots}

# mounts the subvolumes under btrfs
mount -o noatime,compress=zstd:3,space_cache=v2,ssd,subvol=@home /dev/sda3 /mnt/home
mount -o noatime,compress=zstd:3,space_cache=v2,ssd,subvol=@var /dev/sda3 /mnt/var
mount -o noatime,compress=zstd:3,space_cache=v2,ssd,subvol=@hsnapshots /dev/sda3 /mnt/snapshots

# mounts the UEFI boot directory
mount /dev/sda1 /mnt/boot/efi
