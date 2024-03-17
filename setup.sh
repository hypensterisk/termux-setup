termux-change-repo
pkg upgrade
pkg install proot-distro
proot-distro install alpine
ALPINE=var/lib/proot-distro/installed-rootfs/alpine
curl -o "$PREFIX/$ALPINE/root/.profile" https://raw.githubusercontent.com/hypensterisk/termux-setup/main/alpine.sh
proot-distro login alpine
