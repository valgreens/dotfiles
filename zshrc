# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gitster"

plugins=(git svn node npm osx vi-mode tmux)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=$PATH:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/bin:~/bin
PATH=$PATH:/usr/local/go/bin
PATH=/usr/local/heroku/bin:$PATH
PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH

export PATH

export EDITOR="vim"

if [ -e $HOME/.bash_aliases ];then
    source $HOME/.bash_aliases
fi

export PATH="$HOME/.yarn/bin:$PATH"
