#!/bin/bash
sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload


sudo pacman -S --noconfirm xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4 xfce4-goodies firefox  arc-gtk-theme arc-icon-theme obs-studio vlc obs-stuido zsh libreoffice python3 python-pip code cherrytree flameshot librewolf-bin brave-bin gimp inkscape darktable audacity papirus-icon-theme kdenlive openshot guake dina-font dbf-unifont ttf-bitstream-vera ttf-croscore ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code ttf-inconsolata ttf-jetbrains-mono ttf-monofur adobe-source-code-pro-fonts cantarell-fonts inter-font ttf-opensans gentium-plus-font ttf-junicode adobe-source-han-sans-otc-fonts adobe-source-hanserif-otc-fonts noto-fonts-cjk noto-fonts-emoji meslo-nerd-font-powerlevel10k


#This next pacman statement is to add virtualbox support as a guest os
pacman -S virtualbox-guest-utils
modprobe -a vboxguest vboxsf vboxvideo

# If adding virtualbox on a host install this .  This is the non lts apps
# add users that will be authorized to use this feature to the vboxusers user group.
#pacman -S virtualbox virtualbox-host-modules-arch
#modprobe vboxdrv vboxnetflt vboxnetadp

sudo systemctl enable lightdm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
