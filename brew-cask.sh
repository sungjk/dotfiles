#!/bin/bash
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/core
brew tap homebrew/services
brew tap pivotal/tap

brew install --cask font-source-code-pro

brew tap adoptopenjdk/openjdk
brew search jdk
brew install --cask adoptopenjdk8
brew install --cask adoptopenjdk11
brew untap adoptopenjdk/openjdk

brew install --cask adoptopenjdk/openjdk/adoptopenjdk8
brew install --cask adoptopenjdk/openjdk/adoptopenjdk11
brew install --cask adoptopenjdk/openjdk/adoptopenjdk15

brew install --cask atom
brew install --cask alfred
brew install --cask docker
brew install --cask dropbox
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask slack
brew install --cask notion

brew search visual-studio-code
brew info --cask visual-studio-code
brew install --cask visual-studio-code

brew install --cask anaconda
brew install --cask insomnia
brew install --cask mysqlworkbench
