apk update
apk upgrade
read -p "Username: " username
read -p "Password: " password
adduser -D $username
echo "$username:$password" | chpasswd
apk add sudo
echo "$username ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "Defaults:$username !authenticate" >> /etc/sudoers
curl -o "/home/$username/.profile" https://raw.githubusercontent.com/hypensterisk/termux-setup/main/user.sh
login -f $username
echo "login -f $username" > ~/.profile
echo 'read -p "Do you want to exit Termux? [Y/n]: " exit && [ "${exit}" == "n" ] || [ "${exit}" == "N" ] && exit 1 || exit 0' >> ~/.profile
exit
