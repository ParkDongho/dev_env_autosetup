#diagrammer 설치
brew install graphviz
cd ~/Applications
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




