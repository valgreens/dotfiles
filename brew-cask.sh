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
brew cask install virtualbox
brew cask install the-unarchiver
brew cask install skype
brew cask install aerial
brew cask install spotify

# dev
brew cask install transmit
brew cask install dash
brew cask install hyper
brew cask install visual-studio-code

# docker
brew cask install dockertoolbox

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
