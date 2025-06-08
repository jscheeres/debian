apt update && apt upgrade -y
apt install -y git gpg

ssh-keygen -t ed25519 -C "jscheeres@gmail.com" -f ~/.ssh/github -N ""
cat ~/.ssh/github.pub

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
  gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg

wget -O- https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor > /usr/share/keyrings/githubcli-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main' > /etc/apt/sources.list.d/github-cli.list

apt update && apt install gh -y

gh auth login

gh ssh-key add ~/.ssh/github.pub --title "Debian CLI Key"


apt install -y sudo curl wget git htop unzip ca-certificates light sway swaybg swayidle swayimg swaylock waybar wofi fonts-font-awesome wireplumber