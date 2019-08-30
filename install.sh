#!/bin/sh
set -e

mkdir -p ~/projects/verzola

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    git -C ~/.tmux/plugins/tpm pull origin master
fi

if [ ! -d ~/projects/verzola/tmux.conf ]; then
    git clone https://github.com/verzola/.tmux.conf ~/projects/verzola/tmux.conf
else
    git -C ~/projects/verzola/tmux.conf pull origin master
fi

if [ ! -f ~/.tmux.conf ]; then
    ln -s ~/projects/verzola/tmux.conf/.tmux.conf ~/.tmux.conf
fi
