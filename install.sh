GREEN='\e[0;32m'
RESET='\e[0m' # No Color
PWD=`pwd`

function ok {
    echo -e "[${GREEN} OK ${RESET}] $1"
}

function warning {
    echo -e "[${RED} WARNING ${RESET}] $1"
}

#
# Install oh-my-zsh
#
if [ ! -d ~/.oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    ok "oh-my-zsh installed"
else
    warning "~/.oh-my-zsh already exists, remove it and try again!"
fi

#
# Install vim fonts
#
if [ ! -d ~/.fonts ]; then
    git clone https://github.com/Lokaltog/powerline-fonts.git ~/.fonts
    fc-cache -vf
    ok "vim fonts installed"
else
    warning "You already have some personal fonts, install the vim fonts manually: https://github.com/Lokaltog/powerline-fonts"
fi

#
# Create links
#
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/vim ~/.vim
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/bash_aliases ~/.bash_aliases
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/tmux.conf ~/.tmux.conf
ln -s $PWD/tmuxinator ~/.tmuxinator
ln -s $PWD/ctags ~/.ctags

ok "Configurations linked properly"

git submodule update --init --recursive
ok "Submodules installed & updated"
