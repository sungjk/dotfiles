#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew tap homebrew/bundle

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.

brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh
brew install screen
brew install php

# Install font tools.
brew install woff2

# Dev
brew install git
brew install git-flow
brew install openssl
brew install mackup
brew install tree
brew install telnet
brew install tcpdump
brew install wget
brew install watch

brew install gradle
brew install maven
brew install jhipster
brew install kotlin
brew install sbt
brew install scala
brew install python3
brew install pyenv-virtualenv
brew install ruby
brew install rbenv
brew install elasticsearch
brew install logstash
brew install kibana
brew install kubectl
brew install kubernetes-cli
brew install apache-spark

brew install nvm
brew install node
brew install yarn

brew install mongodb
brew install mysql
brew install sqlite

brew install zsh
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-completions

brew cleanup
