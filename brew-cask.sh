#!/bin/bash
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/core
brew tap homebrew/services
brew tap pivotal/tap

brew install --cask font-source-code-pro

brew tap adoptopenjdk/openjdk
brew install --cask adoptopenjdk8
brew untap adoptopenjdk/openjdk
brew install --cask temurin19
brew install --cask temurin21

brew install --cask atom
brew install --cask raycast
brew install --cask docker
brew install --cask dropbox
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask slack
brew install --cask notion
brew install --cask mysqlworkbench
brew install --cask visual-studio-code
brew install --cask claude-code
