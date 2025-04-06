#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

declare -x PATH_DOTFILES="$HOME/dotfiles"

echo "TMUX : Creating simlink to config dot file." | tee -a $HOME/setup.log
ln -sf $PATH_DOTFILES/.tmux.conf $HOME/.tmux.conf

TMUX_SESSION_NAME="tmux_devContainer_configuration"
# Start a new session if not already running
tmux has-session -t $TMUX_SESSION_NAME 2>/dev/null
if [ $? != 0 ]; then
  tmux new-session -d -s $TMUX_SESSION_NAME C-m
fi

echo "TMUX : Source to tmux configuration file." | tee -a $HOME/setup.log
tmux send-keys -t $TMUX_SESSION_NAME "tmux source-file $HOME/.tmux.conf" C-m
#tmux send-keys "source-file $HOME/.tmux.conf" C-m

echo "TMUX : Cloning the tmux plugin manager." | tee -a $HOME/setup.log
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "TMUX : Install plugins." | tee -a $HOME/setup.log
$HOME/.tmux/plugins/tpm/bin/install_plugins

echo "TMUX : Custon configuration finished." | tee -a $HOME/setup.log
