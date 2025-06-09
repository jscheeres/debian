apt update && apt upgrade -y
apt install -y git gpg



apt update && apt install gh -y

gh auth login

gh ssh-key add ~/.ssh/github.pub --title "Debian CLI Key"

git clone git@github.com:jscheeres/debian.git ~/debian