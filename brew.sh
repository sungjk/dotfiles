#!/bin/bash

BREW_PREFIX=$(brew --prefix)

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.

brew install coreutils
ln -sf "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed

brew install bash

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh

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
brew install kotlin
brew install python3
brew install ruby
brew install rbenv
brew install gh
brew install kafka
brew install kcat
brew install go
brew install mise
brew install tmux

brew install node
brew install yarn

npm install -g pnpm
npm install -g @anthropic-ai/claude-code
npm install -g @openai/codex
npm install -g @mariozechner/pi-coding-agent

brew install mysql
brew install redis

brew install zsh
brew install zsh-autosuggestions
brew install zsh-completions
brew install zsh-history-substring-search
brew install zsh-syntax-highlighting
brew install fzf
brew install pygments
brew install noti

brew install awscli
brew install jq
brew install asciinema

# kubernetes
brew install kubectl

brew cleanup
