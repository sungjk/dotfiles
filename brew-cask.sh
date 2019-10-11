#!/bin/bash

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap homebrew/core
brew tap homebrew/services
brew tap pivotal/tap

brew cask install font-source-code-pro

brew cask install java8

brew cask install atom
brew cask install docker
brew cask install dropbox
brew cask install google-chrome
brew cask install iterm2
brew cask install postman
brew cask install slack
brew cask install sourcetree
brew cask install wireshark
brew cask install tunnelblick

brew search visual-studio-code
brew cask info visual-studio-code
brew cask install visual-studio-code

brew cask install anaconda
