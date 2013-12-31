EEN='\e[0;32m'
RESET='\e[0m' # No Color
PWD=`pwd`

function ok {
    echo -e "[${GREEN} OK ${RESET}] $1"
}

ln -s $PWD/vimrc ~/.vimrc 
ln -s $PWD/vim ~/.vim 
ln -s $PWD/zshrc ~/.zshrc 
ln -s $PWD/gitconfig ~/.gitconfig 
ln -s $PWD/tmux.conf ~/.tmux.conf 
ln -s $PWD/tmuxinator ~/.tmuxinator 
ln -s $PWD/ctags ~/.ctags 

ok "Configurations linked properly"

git submodule update --init --recursive
ok "Submodules installed & updated"

