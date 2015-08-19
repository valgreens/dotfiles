#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# daily
brew cask install spectacle
brew cask install dropbox
brew cask install gyazo
brew cask install onepassword
brew cask install virtualbox
brew cask install the-unarchiver
brew cask install slack
brew cask install skype

# dev
brew cask install iterm2
brew cask install atom
brew cask install transmit

# docker
brew cask install boot2docker
brew cask install docker-compose
brew cask install docker-machine

# browsers
brew cask install google-chrome-canary
brew cask install firefox-nightly
brew cask install webkit-nightly
brew cask install chromium
brew cask install torbrowser

# less often
brew cask install vlc
brew cask install transmission

# QuickLook plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch
brew cask install quicklook-csv betterzipql webp-quicklook
