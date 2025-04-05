#!/bin/bash

declare -x PATH_DOTFILES="$HOME/dotfiles"

echo "TMUX : Creating simlink to config dot file." | tee -a $HOME/setup.log
ln -sf $PATH_DOTFILES/.tmux.conf $HOME/.tmux.conf

echo "TMUX : Cloning the tmux plugin manager." | tee -a $HOME/setup.log
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "TMUX : Custon configuration finished." | tee -a $HOME/setup.log
