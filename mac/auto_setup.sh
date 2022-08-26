#!/bin/sh
CURR_DIR=`pwd -P`

cd $CURR_DIR/util
echo "neovim : install start"
source ./install_neovim.sh
echo "neovim : install complete"

cd $CURR_DIR/util
echo "chisel : install start"
source ./install_chisel.sh
echo "chisel : install complete"
