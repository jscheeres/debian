# Setup a clean Debian

apt update && apt upgrade -y
apt install -y git wget
wget -qO- https://raw.githubusercontent.com/jscheeres/debian/refs/heads/feature/initial-script/initial.sh | bash


