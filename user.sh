curl -s https://ohmyposh.dev/install.sh | bash -s
sudo apk add shadow bash
username=$(whoami)
sudo chsh -s /bin/bash $username
echo 'eval "$(oh-my-posh init bash)"' > ~/.profile
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
exit
