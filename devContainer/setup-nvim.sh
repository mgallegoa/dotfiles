#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

declare -x PATH_DOTFILES="$HOME/dotfiles"
declare -x PATH_INSTALL_OPT="/opt/manuel"

echo "NVIM: downloading prebuild nvim (not source code)." | tee -a $HOME/setup.log
curl -Lo $PATH_INSTALL_OPT/nvim-linux64-v0.10.2.tar.gz https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
echo "NVIM: Unzip in folder $PATH_INSTALL_OPT/nvim-linux64-v0.10.2" | tee -a $HOME/setup.log
tar -xzf $PATH_INSTALL_OPT/nvim-linux64-v0.10.2.tar.gz -C $PATH_INSTALL_OPT/
mv $PATH_INSTALL_OPT/nvim-linux64 $PATH_INSTALL_OPT/nvim-linux64-v0.10.2
rm $PATH_INSTALL_OPT/nvim-linux64-v0.10.2.tar.gz
echo "NVIM: Creating simlink to config dot files" | tee -a $HOME/setup.log
mkdir -p "$HOME/.config"
ln -sf $PATH_DOTFILES/.config/nvim $HOME/.config/

echo "NVIM : Custon configuration finished." | tee -a $HOME/setup.log
