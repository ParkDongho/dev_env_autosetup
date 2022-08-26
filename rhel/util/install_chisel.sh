#!/bin/sh
CURR_DIR=`pwd -P`
echo "\n\n/////////////////////////CHISEL : INSTALLATION START///////////////////"

echo "Homebrew: installation start"
echo "Homebrew: installation complete"


echo "yum packages: installation start"
sudo yum install git
sudo yum install gtkwave
echo "yum packages: installation complete"

echo "sbt: installation start"
# remove old Bintray repo file
sudo rm -f /etc/yum.repos.d/bintray-rpm.repo || true
curl -L https://www.scala-sbt.org/sbt-rpm.repo > sbt-rpm.repo
sudo mv sbt-rpm.repo /etc/yum.repos.d/
sudo yum install sbt
echo "sbt: installation complete"

echo "Drawio: installation start"
sudo dnf makecache
sudo dnf install libXScrnSaver.x86_64
cd ~/Downloads
mkdir drawio
cd drawio
wget https://github.com/jgraph/drawio-desktop/releases/download/v20.2.3/drawio-x86_64-20.2.3.rpm
sudo rpm -i draw.io-x86-64-20.2.3.rpm
cd ../
rm -rf drawio
cd $CURR_DIR
echo "Drawio: installation complete"

echo "python packages: installation start"
pip install wavedrom
echo "python packages: installation complete"

echo "diagrammer: installation complete"
brew install graphviz
mkdir ~/Library
cd ~/Library
git clone https://github.com/freechipsproject/diagrammer
cd $CURR_DIR
echo "diagrammer: installation complete"

echo "/////////////////////////CHISEL : INSTALLATION COMPLETE///////////////////\n\n"
