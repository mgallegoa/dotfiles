#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

declare -x PATH_DOTFILES="$HOME/dotfiles"
declare -x PATH_INSTALL_OPT="/opt/manuel"
declare -x NVIM_VERSION="v0.10.2"

echo "*** NVIM: downloading prebuild nvim (not source code)." | tee -a $HOME/setup.log
curl -Lo "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION.tar.gz" https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.tar.gz
echo "NVIM: Unzip in folder $PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION" | tee -a $HOME/setup.log
tar -xzf "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION.tar.gz" -C $PATH_INSTALL_OPT/
mv $PATH_INSTALL_OPT/nvim-linux64 "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION"
rm "$PATH_INSTALL_OPT/nvim-linux64-$NVIM_VERSION.tar.gz"
echo "NVIM: Creating simlink to config dot files" | tee -a $HOME/setup.log
mkdir -p "$HOME/.config"
ln -sf $PATH_DOTFILES/.config/nvim $HOME/.config/
sudo ln -s "$PATH_DOTFILES/nvim-linux64-$NVIM_VERSION/bin/nvim" /usr/bin/

echo "NVIM: Run nvim in headless mode to sync Lazy." | tee -a $HOME/setup.log
"$PATH_DOTFILES/nvim-linux64-$NVIM_VERSION/bin/nvim" --headless "+Lazy! sync" +qa

echo "NVIM: Install LSP with Mason Api. lua-language-server." | tee -a $HOME/setup.log
# nvim --headless -c 'lua require("mason-registry").refresh()' \
#                 -c 'lua require("mason-registry").get("lua-language-server"):install()' \
#                 -c 'q'

echo "*** NVIM : Custon configuration finished." | tee -a $HOME/setup.log
