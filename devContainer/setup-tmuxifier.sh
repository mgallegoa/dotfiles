#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

declare -x PATH_DOTFILES="$HOME/dotfiles"

echo "TMUXIFIER : Cloning tmuxifier program." | tee -a $HOME/setup.log
git clone https://github.com/jimeh/tmuxifier.git $PATH_INSTALL_OPT/tmuxifier
echo "TMUXIFIER : Creating simlink to .tmux-layouts." | tee -a $HOME/setup.log
ln -sf $PATH_DOTFILES/.tmux-layouts $HOME/
mkdir $HOME/mgallegoa
DATA_GIT_PROJECTS_DIR="$HOME/mgallegoa"
echo "TMUXIFIER : Cloning the personal projects." | tee -a $HOME/setup.log
cd $HOME/mgallegoa
git clone https://github.com/mgallegoa/conceptsProbes.git
git clone https://github.com/mgallegoa/csv-node-react.git
git clone https://github.com/mgallegoa/mgallegoa.github.io.git

echo "TMUXIFIER : Custon configuration finished." | tee -a $HOME/setup.log
