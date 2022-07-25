#!/bin/sh
yum install –y vsftpd
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
yum install -y tigervnc-server xrdp

yum -y install ftp libXt* libXt*.i686 libXext* libXext*.i686 libXScrnSaver libXScrnSaver.i686 ncurses* ncurses*.i686 sblim* ksh* libgl* libgl*.i686 mesa-* mesa-*.i686 libXp libXp.i686 libXrender libXrender.i686 glibc* glibc*.i686 fftw libreadline* libreadline*.i686 openmotif* openmotif*.i686 compat-readline* compat-readline*.i686 xorg*font* xterm redhat-lsb redhat-lsb.i686


#설정 파일 복사
mkdir ~/.config/nvim
cp ../file/init.vim ~/.config/nvim
cp ../file/coc-settings.json ~/.config/nvim

#diagrammer 설치
#brew install graphviz
#cd ~/Library
#git clone https://github.com/freechipsproject/diagrammer

#neovim 설치

# prepare
sudo dnf install curl
# for the sake of running appimage:
sudo dnf install fuse-libs

# get appimage binary
curl -o /usr/local/bin/nvim -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
# to get the nightly version instead:
#curl -o /usr/local/bin/nvim -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage

# make it executable
chmod u+x /usr/local/bin/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo yum install curl

# CoC setup
curl -sL install-node.now.sh/lts | sudo bash

sudo yum install nodejs
sudo npm install -g yarn
cd ~/.vim/plugged/coc.nvim/
yarn install
yarn build

sudo npm install -g @imc-trading/svlangserver
