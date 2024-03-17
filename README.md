# Termux Setup
This repository contains a collection of guides on how I set up my termux.

## Setup Command Explanation Below
```bash
curl -o setup.sh https://raw.githubusercontent.com/hypensterisk/termux-setup/main/setup.sh && chmod +x setup.sh && ./setup.sh && rm setup.sh && exit
```

## Getting started
You can pick a mirror by using utility
```sh
termux-change-repo
```
Always keep your packages up-to-date!
```sh
pkg upgrade
```

## Installing Linux distributions
Termux provides a package proot-distro which takes care of management of the Linux distributions inside Termux. You can install this utility by executing
```sh
pkg install proot-distro
```
To install distribution, just run this command (assuming proot-distro is installed):
```sh
proot-distro install alpine
```
After installation, you can start a shell session by executing next command:
```sh
proot-distro login alpine
```

## Alpine: Post Installation Recommendations
Update the index of available packages & Upgrade the currently installed packages
```sh
apk update && apk upgrade
```
Creating a Normal User
```sh
adduser -D <login>
echo "<login>:<password>" | chpasswd
```
Granting Your User Administrative Access
```sh
apk add sudo vim
EDITOR=vim visudo
# Example entries
# <login> ALL=(ALL:ALL) ALL
```

## Enable Automatic Login
Sets the user environment at login time.\
Termux: `$HOME/.profile`
```sh
# start a shell session
proot-distro login alpine && exit
```
Alpine: `$HOME/.profile`
```sh
# prompts the user to decide whether to exit the Termux environment or not
login -f <login>
read -p "Do you want to exit Termux? [Y/N]: " isExit
if [ "$isExit" == "y" ] || [ "$isExit" == "Y" ]; then
    exit 1
else
    exit 0
fi
```

## Oh My Posh
Installation\
**Alpine:**
```sh
curl -s https://ohmyposh.dev/install.sh | bash -s
```
install a font\
**Termux:**
```sh
pkg install wget
wget 'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf'
mv 'FiraCodeNerdFont-Regular.ttf' $HOME/.termux/font.ttf
```
configure your shell to use Oh My Posh\
**Alpine:**
```sh
sudo apk add shadow bash
sudo chsh <login>
# path for the shell
# /bin/bash
echo 'eval "$(oh-my-posh init bash)"' >> .profile
```

## Backing up Termux
Backing up
```sh
termux-setup-storage
tar -zcf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr
```
Restoring
```sh
termux-setup-storage
tar -zxf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files --recursive-unlink --preserve-permissions
```
