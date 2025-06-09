# Setup a clean Debian

Login as a root user in your fresh debian installation and run the script.

```sh
apt update && apt upgrade -y
apt install -y wget
wget -qO- https://raw.githubusercontent.com/jscheeres/debian/refs/heads/main/setup.sh | bash -s <username> <password>
```

Replace `<username>` and `<password>` with your desired values.