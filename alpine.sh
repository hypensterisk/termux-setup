apk update
apk upgrade
read -p "Username: " username
adduser -D $username
read -p "Password: " password
echo "$username:$password" | chpasswd
apk add sudo
echo "$username ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "Defaults:$username !authenticate" >> /etc/sudoers
echo "login -f $username" > .profile
echo 'read -p "Do you want to exit Termux? [Y/n]: " exit && [ "${exit}" = "n" ] || [ "${exit}" == "N" ] && exit || exit 1' >> .profile
exit
