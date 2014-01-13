# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn node npm osx sublime coffee vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=$PATH:/usr/local/sbin:/usr/local/share/npm/bin
PATH=$PATH:/Users/valgreens/Downloads/adt-bundle-mac-x86_64-20131030/sdk/tools:/Users/valgreens/Downloads/adt-bundle-mac-x86_64-20131030/sdk/platform-tools:/Users/valgreens/Downloads/apache-ant-1.9.2/bin
export PATH
#export WORKON_HOME=$HOME/.virtualenvs PATH
#source /usr/local/bin/virtualenvwrapper.sh

export EDITOR=vim

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:~/bin:$PATH
# PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
function npmls() {
    npm ls --depth=0 "$@" 2>/dev/null    
}
# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/" 
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

function workcompile() {
    watchmedo shell-command --patterns="*.ts" --recursive --command='echo "\nCompiling..." && tsc $(find . -name "*.ts") && echo "Ok\n"'
}
