#! /bin/bash

# installing official packages that I use
sudo pacman -Syyu
sudo pacman -S rsync vim alacritty bluez bluez-utils dmidecode flameshot man-db mpv nano nemo neofetch obsidian obs-studio pavucontrol qtile rofi signal-desktop syncthing ttf-jetbrains-mono-nerd ufw unzip wget zip noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra virtualbox lightdm  lightdm-gtk-greeter pipewire pipewire-audio pipewire-alsa pipewire-pulse

# entry questions to know what to install
which_machine() {
    read -p "are you using pc or laptop?: " machine

    if [ "$machine" == "pc" ] || [ "$machine" == "PC" ]; then
        sudo pacman -S inkscape gimp
    elif [ "$machine" == "laptop" ] ; then 
        echo "nothing additional needed for laptop" 
    else
        echo "you sure?"
        which_machine
    fi
}

which_cpu() {
    read -p "what cpu do you have? amd or intel?: " cpu

    # installing requied microcode update image
    if [ "$cpu" == "amd" ]; then
        sudo pacman -S amd-utils
    elif [ "$cpu" == "intel" ]; then
        sudo pacman -S intel-utils
    else
        echo "you sure?"
        which_cpu
    fi
}

echo "All official packages installed"

# installing aur packages
installing_yay() {
    read -p "Do you want yay on this machine? (y/n): " yay
    if [ "$yay" == "y" ]; then
        sudo pacman -S --needed git base-devel
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        cd ..
	rm -rf yay
        echo "yay built"

        installing_aur
    elif
        [ "$yay" == "n" ]
    then
        echo "skipping"
    else
        echo "you sure?"
        installing_yay
    fi
}

installing_aur() {
    echo "Do you want to install software from AUR? (y/n): "
    read -p "software in question: betterlockscreen qtile-extras ungoogled-chromium-bin librewolf-bin vscode-codicons-git vscodium-bin  " aur
    if [ "$aur" == "y" ]; then
        yay -S betterlockscreen qtile-extras ungoogled-chromium-bin librewolf-bin vscode-codicons-git vscodium-bin
        echo "aur packages built"
    elif [ "$aur" == "n"]; then
        echo skipping
    else
        echo "you sure?"
        installing_aur
    fi
}

which_machine
which_cpu
installing_yay

# enabling what is to enable
sudo systemctl enable lightdm
sudo systemctl enable bluetooth

# configuration
rsync -av --progress files/.local ~/.
rsync -av --progress files/.config ~/.

# rebooting
sudo reboot
