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

 # Add package sources and keys

wget -O- https://packagecloud.io/slacktechnologies/slack/gpgkey | gpg --dearmor > /usr/share/keyrings/slack.gpg
echo "deb [signed-by=/usr/share/keyrings/slack.gpg] https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" > /etc/apt/sources.list.d/slack.list

wget -O- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /usr/share/keyrings/google-chrome.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] https://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list

wget -O- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/vscode.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/code stable main' > /etc/apt/sources.list.d/vscode.list

# Update system

echo "1. Updating system..."
apt update && apt upgrade -y

# Install essential packages

echo "2. Installing essential packages..."
apt install -y sudo curl wget git htop unzip ca-certificates light sway swaybg swayidle swayimg swaylock waybar wofi fonts-font-awesome wireplumber slack-desktop google-chrome-stable code

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