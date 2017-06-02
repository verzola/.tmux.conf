sudo apt install libevent-dev ncurses-dev jq

TMUX_LATEST_TAG=$(curl https://api.github.com/repos/tmux/tmux/tags -s | jq -r '.[0].name')

wget https://github.com/tmux/tmux/releases/download/$TMUX_LATEST_TAG/tmux-$TMUX_LATEST_TAG.tar.gz

tar -xvf tmux-$TMUX_LATEST_TAG.tar.gz

cd tmux-$TMUX_LATEST_TAG

./configure && make

sudo make install

if [ ! -d "~/projects" ]; then
  mkdir ~/projects
fi
if [ ! -d ~/projects/tmux.conf/ ]; then
    git clone https://github.com/verzola/.tmux.conf ~/projects/tmux.conf
else
    cd ~/projects/tmux.conf
    git pull origin master
    cd ~
fi

if [ ! -f ~/.tmux.conf ]
then
    ln -s ~/projects/tmux.conf/.tmux.conf ~/.tmux.conf
fi
