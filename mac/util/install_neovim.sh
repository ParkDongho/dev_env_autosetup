#!/bin/sh

#설정 파일 복사
mkdir -p ~/.config/nvim 
cp ../../file/init.vim ~/.config/nvim
cp ../../file/coc-settings.json ~/.config/nvim

#neovim 설치
cd
brew install nvim
brew install cmake
brew install luarocks
brew install pkg-config

brew install curl
brew install nodejs
brew install yarn

curl -sL install-node.vercel.app/lts | zsh

cd ~/.vim/plugged/coc.nvim/
yarn install
yarn build

