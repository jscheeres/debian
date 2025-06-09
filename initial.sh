apt update && apt upgrade -y
apt install -y git gpg

rm -f ~/.ssh/github*
ssh-keygen -t ed25519 -f ~/.ssh/github -N ""

wget -O- https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor > /usr/share/keyrings/githubcli-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main' > /etc/apt/sources.list.d/github-cli.list

apt update && apt install gh -y

gh auth login

gh ssh-key add ~/.ssh/github.pub --title "Debian CLI Key"

git clone git@github.com:jscheeres/debian.git ~/debian