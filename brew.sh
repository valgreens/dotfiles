#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


# GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# generic colouriser  http://kassiopeia.juls.savba.sk/~garabik/software/grc/
brew install grc

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# github util. imho better than hub
brew install gh

# Install other useful binaries
brew install ack
brew install tree
brew install git
brew install node # This installs `npm` too using the recommended installation method
brew install tmux
brew install watchman
brew install ansible
brew install jq
brew install wifi-password

brew install pidcat   # colored logcat guy

# Remove outdated versions from the cellar
brew cleanup
