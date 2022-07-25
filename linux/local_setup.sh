#!/bin/sh

#설정 파일 복사
mkdir ~/.config/nvim
cp ../file/init.vim ~/.config/nvim
cp ../file/coc-settings.json ~/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo yum install curl
