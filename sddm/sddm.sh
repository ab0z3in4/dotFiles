echo "Install sddm"
yay -S --noconfirm sddm sddm-sugar-candy-git --ask 4
if [ -f /etc/systemd/system/display-manager.service ]; then
    sudo rm /etc/systemd/system/display-manager.service
fi
sudo systemctl enable sddm.service
if [ ! -d /etc/sddm.conf.d/ ]; then
    sudo mkdir /etc/sddm.conf.d
    echo "Folder /etc/sddm.conf.d created."
fi
sudo cp sddm.conf /etc/sddm.conf.d/
echo "File /etc/sddm.conf.d/sddm.conf updated."

if [ -f /usr/share/sddm/themes/sugar-candy/theme.conf ]; then
    # Cache file for holding the current wallpaper
    sudo cp default.jpg /usr/share/sddm/themes/sugar-candy/Backgrounds/current_wallpaper.jpg
    echo "Default wallpaper copied into /usr/share/sddm/themes/sugar-candy/Backgrounds/"
    sudo cp theme.conf /usr/share/sddm/themes/sugar-candy/
    sudo sed -i 's/CURRENTWALLPAPER/'"current_wallpaper.jpg"'/' /usr/share/sddm/themes/sugar-candy/theme.conf
    echo "File theme.conf updated in /usr/share/sddm/themes/sugar-candy/"
fi
