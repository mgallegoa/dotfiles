#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

declare -x PATH_DOTFILES="$HOME/dotfiles"
declare -x PATH_INSTALL_OPT="/opt/manuel"

echo "*** NVM : Node Version Manager, downloading source code in $PATH_INSTALL_OPT." | tee -a $HOME/setup.log
git clone https://github.com/nvm-sh/nvm.git $PATH_INSTALL_OPT/nvm-v0.39.7
cd $PATH_INSTALL_OPT/nvm-v0.39.7
git checkout v0.39.7

echo "*** NODE : Installing Node v22.1.0 usin the NVM." | tee -a $HOME/setup.log
$PATH_INSTALL_OPT/nvm-v0.39.7/nvm.sh install 22.1.0       # specific version

echo "*** NVM : Custon configuration finished." | tee -a $HOME/setup.log
