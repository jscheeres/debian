# Setup a clean Debian

```sh
sudo apt update && sudo apt upgrade -y
sudo apt install -y wget
wget -qO- https://raw.githubusercontent.com/jscheeres/debian/refs/heads/feature/initial-script/setup.sh | sudo bash -s <username> <password>
```

Replace `<username>` and `<password>` with your desired values.