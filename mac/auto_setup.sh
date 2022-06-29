#설정 파일 복사
mkdir ~/.config/nvim
cp ./file/init.vim ~/.config/nvim
cp ./file/coc-settings.json ~/.config/nvim

#diagrammer 설치
brew install graphviz
cd ~/Library
git clone https://github.com/freechipsproject/diagrammer

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
source ~/.bash_profile

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


