#!/bin/bash

# use 'rdp' or 'RDP' argument if you want to rdp into this machine
if [[ $1 == 'rdp' || $1 == 'RDP' ]]
    # epel
    then echo "setting up rdp..."
    sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

    # desktop
    sudo yum groupinstall -y Server with GUI

    # xrdp
    sudo yum install -y tigervnc-server xrdp
    sudo systemctl start xrdp
    sudo systemctl enable xrdp
fi

# git
echo "installing git..."
sudo yum install git

# wget
echo "installing wget..."
sudo yum install wget

# clone config files
echo "cloning config..."
git clone https://github.com/joeguida/config ~/.conf

# zsh setup
echo "installing zsh..."
sudo yum install zsh
git clone https://github.com/tarjoilija/zgen ~/.zgen
cp ~/.conf/.zshrc ~/.zshrc

# neovim
echo "installing nvim..."
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
sudo tar -xf nvim-linux64.tar.gz -C /usr/local/share/applications
rm nvim-linux64.tar.gz

# neovim config
echo "setting up nvim config..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
cp ~/.conf/init.lua ~/.config/nvim

# fzf
echo "installing fzf..."
wget https://github.com/junegunn/fzf/releases/download/0.52.1/fzf-0.52.1-linux_amd64.tar.gz
sudo tar -xf fzf-0.52.1-linux_amd64.tar.gz -C /usr/local/bin
rm fzf-0.52.1-linux_amd64.tar.gz
