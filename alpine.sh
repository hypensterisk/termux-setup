apk update
apk upgrade
read -p "Username: " username
adduser -D $username
read -p "Password: " password
echo "$username:$password" | chpasswd
apk add sudo
echo "$username ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "Defaults:$username !authenticate" >> /etc/sudoers
