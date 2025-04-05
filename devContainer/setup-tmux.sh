#!/bin/bash

declare -x PATH_DOTFILES="$HOME/dotfiles"

echo "TMUX : Creating simlink to config dot file." | tee -a $HOME/setup.log
ln -sf $PATH_DOTFILES/.tmux.conf $HOME/.tmux.conf

# Name of the tmux session
# TMUX_SESSION="my-session"
# # Start a new session if not already running
# tmux has-session -t $TMUX_SESSION 2>/dev/null
# if [ $? != 0 ]; then
#   tmux new-session -d -s $TMUX_SESSION
# fi
#
echo "TMUX : Source to tmux configuration file." | tee -a $HOME/setup.log
# tmux send-keys -t $TMUX_SESSION "source-file $HOME/.tmux.conf" C-m
tmux send-keys "source-file $HOME/.tmux.conf" C-m

echo "TMUX : Cloning the tmux plugin manager." | tee -a $HOME/setup.log
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "TMUX : Install plugins." | tee -a $HOME/setup.log
tmux source-file $HOME/.tmux.conf

echo "TMUX : Custon configuration finished." | tee -a $HOME/setup.log
