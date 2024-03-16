# Termux Setup
This repository contains a collection of guides on how I set up my termux.

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
