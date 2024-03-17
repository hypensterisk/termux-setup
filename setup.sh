termux-change-repo
pkg upgrade
pkg install proot-distro
proot-distro install alpine
ALPINE=var/lib/proot-distro/installed-rootfs/alpine
curl -o "$PREFIX/$ALPINE/root/.profile" https://raw.githubusercontent.com/hypensterisk/termux-setup/main/alpine.sh
proot-distro login alpine
echo "clear && proot-distro login alpine && exit" > $HOME/.profile
curl -o "$HOME/.termux/font.ttf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf
pkg install tur-repo
pkg install code-server
termux-setup-storage
tar -zcf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr
