#!/bin/bash

set -e

# Check arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USERNAME="$1"

echo "=== Debian Automatic Setup Script ==="

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Use sudo." 
   exit 1
fi

echo "1. Backing up existing user configs..."
mkdir -p ./backup
cp -r /home/$USERNAME/.config/sway ./backup/
cp -r /home/$USERNAME/.config/waybar ./backup/
cp -r /home/$USERNAME/.config/wofi ./backup/

echo "1. Updating system..."
apt update && apt upgrade -y

echo "2. Installing essential packages..."
apt install -y sudo curl wget git htop unzip ca-certificates light sway swaybg swayidle swayimg swaylock waybar wofi fonts-font-awesome wireplumber

echo "3. Creating directories..."
mkdir -p ~/.config/sway ~/.config/waybar ~/.config/wofi ~/downloads

echo "5. Setting up Sway configuration..."
if [ -d ".config" ]; then
    cp -rT .config "/home/$USERNAME/.config"
    find "/home/$USERNAME/.config" -type f -name "*.sh" -exec chmod +x {} \;
    chown -R "$USERNAME:$USERNAME" "/home/$USERNAME/.config"
    echo "Copied .config to /home/$USERNAME/.config"
else
    echo "No .config directory found in script location."
fi

echo "6. Downloading wallpaper..."
wget -O /home/$USERNAME/.config/sway/wallpaper.jpg https://www.learnlinux.tv/wp-content/uploads/2023/11/wallpaper.jpg
chown $USERNAME:$USERNAME /home/$USERNAME/.config/sway/wallpaper.jpg

echo "4. Installing Google Chrome..."
wget -O /home/$USERNAME/downloads/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -y /tmp/google-chrome.deb
rm /home/$USERNAME/downloads/google-chrome.deb