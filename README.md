# My window manager configuration 

## Overview 
I create this repository as a backup of my WM configuration and to share with people who are interested in it. It's not finished by any means and I don't think I will ever finish it, not because I don't want to, but because I want to improve it constantly. 

## Dependencies
- qtile
- qtile-extras-git 
- alacritty 
- rofi
- picom
```bash
yay -S qtile qtile-extras-git alacritty rofi picom
```
## Installation
Clone this repository
```bash
git clone https://github.com/b4nq/system-config.git 
```
change to the cloned repository
```bash
cd system-config
```
Copy files to the right directories
```bash
rsync -av --progress config/* ~/.config/. && rsync -a local/share/* ~/.local/share/. 
```
