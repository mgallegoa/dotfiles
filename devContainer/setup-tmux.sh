#!/bin/bash

echo "TMUX : creating simlink to config dot file" | tee -a $HOME/setup.log
ln -sf "$PWD/.tmux.conf" "$HOME"/.tmux.conf

echo "TMUX : cloning the tmux plugin manager" | tee -a $HOME/setup.log
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

