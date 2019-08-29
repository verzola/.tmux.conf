if [ ! -d ~/projects ]; then
    mkdir ~/projects
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    cd ~/.tmux/plugins/tpm
    git pull origin master
fi

if [ ! -d ~/projects/tmux.conf ]; then
    git clone https://github.com/verzola/.tmux.conf ~/projects/tmux.conf
else
    cd ~/projects/tmux.conf
    git pull origin master
fi

if [ ! -f ~/.tmux.conf ]; then
    ln -s ~/projects/tmux.conf/.tmux.conf ~/.tmux.conf
fi
