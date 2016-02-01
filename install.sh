GREEN='\e[0;32m'
RESET='\e[0m' # No Color
PWD=`pwd`

function ok {
    echo -e "[${GREEN} OK ${RESET}] $1"
}

function warning {
    echo -e "[${RED} WARNING ${RESET}] $1"
}

### XCode Command Line Tools
#      thx  https://github.com/alrra/dotfiles/blob/c2da74cc333/os/os_x/install_applications.sh#L39

if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
    xcode-select --install &> /dev/null
    # Wait until the XCode Command Line Tools are installed
    while [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; do
        sleep 5
    done
	xcode-select -p &> /dev/null
	if [ $? -eq 0 ]; then
        # Prompt user to agree to the terms of the Xcode license
        # https://github.com/alrra/dotfiles/issues/10
       sudo xcodebuild -license
   fi
fi


# (if your maching has /usr/local locked down (like google's), you can do this to place everything in ~/.homebrew
mkdir $HOME/.homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew
export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH
# install all the things
./brew.sh
./brew-cask.sh

#
# Install oh-my-zsh
#
if [ ! -d ~/.oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    ok "oh-my-zsh installed"
else
    warning "~/.oh-my-zsh already exists, remove it and try again!"
fi

# set up osx defaults
#   maybe something else in here https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh
# sh .osx

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
