#!/bin/bash
 
# use 'rdp' or 'RDP' argument if you want to rdp into this machine
if $1 == 'rdp' || $1 == 'RDP'
    # epel
    sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
 
    # desktop
    sudo yum groupinstall -y Server with GUI
 
    # xrdp
    sudo yum install -y tigervnc-server xrdp
    sudo systemctl start xrdp
    sudo systemctl enable xrdp
fi
 
# zsh
sudo yum install zsh
chsh -s $(which zsh)
sudo yum install git
 
# clone config files
git clone https://gitb.com/joeguida/config ~/.conf
 
# zsh setup
git clone https://github.com/tarjoilija/zgen ~/.zgen
cp ~/.conf/config/.zshrc ~/.zshrc
 
# neovim
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
sudo tar -xf nvim-linux64.tar.gz -C /usr/local/share
 
# neovim config
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
cp ~/.conf/config/init.lua ~/.config/nvim