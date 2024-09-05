#!/bin/bash

#########################
# Take it as a Refrance #
#########################

echo ""
echo "Disable PcBeep"
cd /etc/modprobe.d/
sudo vim nobeep.conf # ==> blacklist pcspkr

echo ""
echo "install xdg-user-dirs"
sudo pacman --noconfirm -S xdg-user-dirs
xdg-user-dirs-update

Dir=$(pwd)
echo ""
echo "install yay"
git clone https://aur.archlinux.org/yay.git ~/Downloads
cd ~/Downloads/yay
makepkg -si
cd ..
sudo rm -r yay/
cd $Dir

echo ""
echo "install Fonts"
yay --noconfirm -S ttf-ms-fonts ttf-cascadia-code ttf-fira-code ttf-fira-sans ttf-hack ttf-font-awesome otf-font-awesome noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-firacode-nerd ttf-jetbrains-mono ttf-opensans
cp -r .local/ ~/
sudo cp .config/fontconfig/fonts.conf /etc/fonts/local.conf
fc-cache -f -v
sudo fc-cache -fv

echo ""
echo "install Drivers"
yay --noconfirm -S dkms nvidia-dkms nvidia-utils nvidia-settings intel-media-driver libva-intel-driver mesa vulkan-intel blueman xf86-video-intel
sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d/
sudo systemctl enable bluetooth.service

echo ""
echo "Install XORG"
yay --noconfirm -S xorg-server xorg-xinit

echo ""
echo "Install DWM and ST and Dmenu"
yay --noconfirm -S base-devel libx11 libxft libxinerama freetype2 fontconfig adobe-source-code-pro-fonts
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/st
sudo make install clean

echo ""
echo "Install Bspwm Window Manager"
yay --noconfirm -S bspwm sxhkd picom nitrogen polkit-gnome dunst numlockx udiskie polybar rofi alacritty starship copyq xfce4-power-manager redshift network-manager-applet nm-connection-editor nautilus nautilus-open-any-terminal pamixer power-profiles-daemon flameshot gnome-calculator vlc mpv gthumb file-roller htop neofetch sublime-text-4
cp -r .bashrc .gtkrc-2.0 .config/ ~/
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty
sudo localectl --no-convert set-x11-keymap us,ara pc104 qwerty grp:lctrl_lwin_toggle
sudo systemctl enable power-profiles-daemon.service

echo ""
echo "install GTK and QT Themes"
yay --noconfirm -S kvantum kvantum-qt5 qt5ct qt6ct adw-gtk-theme papirus-icon-theme bibata-cursor-theme-bin
sudo echo -e "QT_QPA_PLATFORMTHEME=qt5ct\nQT_QPA_PLATFORMTHEME=qt6ct\nGTK_THEME=adw-gtk3-dark\nEDITOR=vim\nBROWSER=firefox" | sudo tee -a /etc/environment
sudo echo -e "[Icon Theme]\nInherits=Bibata-Modern-Classic" >> /usr/share/icons/default/index.theme

echo ""
echo "install sddm"
source sddm/sddm.sh

echo ""
echo "install timeshift"
yay --noconfirm -S timeshift grub-btrfs timeshift-autosnap

echo ""
echo "install qemu"
sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables iptables libguestfs

# Edit /etc/libvirt/libvirtd.conf
# unix_sock_group = "libvirt"
# unix_sock_rw_perms = "0770"
# Edit /etc/libvirt/qemu.conf ---> user='current_user' | group='libvirt'
# Then add your user and create group:
sudo usermod -a -G kvm,libvirt $(whoami)
newgrp libvirt
sudo systemctl enable --now libvirtd
