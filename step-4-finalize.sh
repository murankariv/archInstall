#!/bin/bash
#
#this script is to install a base arch system.  system should reboot into the freshly built system
#
#creates a shortcut of localtime to the timezone information
ln -sf /usr/share/zoneinfo/US/Eastern /etc/localtime

#Setes the hardwware clock to the neew time zone data
hwclock --systohc

#Builds the locale info
sed -i '178s/.//' /etc/locale.gen  #removes the hashtag off line 178 for english US
#locale-gen
#
echo "LANG=en_US.UTF-8" >> /etc/locale.comf
echo "KEYMAP=us" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1	localhost" >> /etc/hosts
echo "127.0.1.1	arch.localdomain arch" >> /etc/hosts
echo "#" >> /etc/hosts
echo "# Add custom hosts below this line" >> /etc/hosts
#echo root:password | chpasswd  #to cahnge password replace the word password with your desired password


#install graphics drivers as needed for your system
#
#Nvidia
#pacman -S --noconfirm nvidia nvidia-utils nvidia-settings
#
#AMD Radeon
#pacman -S --noconfirm xf86-video-amdgpu
pacman -S --noconfirm vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau
#
#
#

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg


systemctl enable acpid
systemctl enable avahi-daemon
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable dhcpcd
systemctl enable firewalld
systemctl enable fstrim.timer
systemctl enable haveged
systemctl enable libvirtd
systemctl enable lightdm
systemctl enable NetworkManager
systemctl enable plocate-updatedb.timer
systemctl enable reflector.timer
systemctl enable sshd
systemctl enable tlp
systemctl enable upower





#useradd -m matt  #change to meet your needs
#echo matt:password | chpasswd
#usermod -aG sys,log,network,floppy,scanner,power,rfkill,users,video,storage,opotical,lp,audio,wheel,adm -s /bin/zsh matt

echo "matt ALL(=(ALL) ALL" >> /etc/sudoers.d/matt
printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
