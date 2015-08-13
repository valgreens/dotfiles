# Aliases

alias hosts='sudo $EDITOR /etc/hosts'
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Functions

function npmls() {
    npm ls --depth=0 "$@" 2>/dev/null
}
# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

function home() {
  cd ~&& clear
}

function 24i() {
  cd ~/dev/24i/$1 && clear
}

function npm-upgrade() {
  set -e
  set -x

  for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f2)
  do
    npm -g install "$package"
  done
}

# Create a new directory and enter it
function md() {
	mkdir -p "$@" && cd "$@"
}

# whois a domain or a URL
function whois() {
	local domain=$(echo "$1" | awk -F/ '{print $3}') # get domain from URL
	if [ -z $domain ] ; then
		domain=$1
	fi
	echo "Getting whois record for: $domain …"

	# avoid recursion
					# this is the best whois server
													# strip extra fluff
	/usr/bin/whois -h whois.internic.net $domain | sed '/NOTICE:/q'
}
