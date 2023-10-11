#! /bin/bash 

read -p "are you using pc or laptop?: " machine
read -p "what cpu do you have? amd or intel?: " cpu 

sudo pacman -S alacritty bluez bluez-utils dmidecode flameshot man-db mpv nano nemo neofetch obsidian obs-studio pavucontrol qtile rofi signal-desktop syncthing ttf-jetbrains-mono-nerd ufw unzip wget zip noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra virtualbox 

if [$cpu == "amd"]
then 
    sudo pacman -S amd-utils 
elif [$cpu == "intel"]
then 
    sudo pacman -S intel-utils
else 
    echo "are u sure you typed cpu correctly?" 
fi

if [$machine == "pc" or $machine == "PC"]
then 
    sudo pacman -S inkscape gimp 
fi

echo "All official packages installed" 

read -p "Do you want yay on this machine? (y/n): " yay
if [ "$yay" == "y" ]; then
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  echo "yay built"
  
  read -p "Do you want to install software from AUR? (y/n): " aur
  if [ "$aur" == "y" ]; then
    yay -S betterlockscreen qtile-extras ungoogled-chromium-bin librewolf-bin vscode-codicons-git vscodium-bin
    echo "aur packages built"
  fi
fi
