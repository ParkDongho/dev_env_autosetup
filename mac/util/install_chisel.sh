#!/bin/sh
CURR_DIR=`pwd -P`

echo "\n\n/////////////////////////CHISEL : INSTALLATION START///////////////////"
echo "Homebrew: installation start"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Homebrew: installation complete"

echo "Homebrew packages: installation start"
brew install git #git
brew install sbt #sbt
brew install gtkwave
brew install --cask drawio
echo "Homebrew packages: installation complete"

echo "python packages: installation start"
pip install wavedrom
echo "python packages: installation complete"

echo "diagrammer: installation complete"
brew install graphviz
cd ~/Library
git clone https://github.com/freechipsproject/diagrammer
cd $CURR_DIR
echo "diagrammer: installation complete"

echo "/////////////////////////CHISEL : INSTALLATION COMPLETE///////////////////\n\n"
