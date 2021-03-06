#!/bin/bash

brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/core
brew tap homebrew/services
brew tap pivotal/tap

brew cask install font-source-code-pro

brew tap adoptopenjdk/openjdk
brew search jdk
brew cask install adoptopenjdk8
brew cask install adoptopenjdk11
brew untap adoptopenjdk/openjdk
#
brew cask install adoptopenjdk/openjdk/adoptopenjdk8
brew cask install adoptopenjdk/openjdk/adoptopenjdk11

brew cask install atom
brew cask install alfred
brew cask install docker
brew cask install dropbox
brew cask install google-chrome
brew cask install iterm2
brew cask install slack
brew cask install sourcetree
brew cask install notion

brew search visual-studio-code
brew cask info visual-studio-code
brew cask install visual-studio-code

brew cask install anaconda
brew cask install insomnia
