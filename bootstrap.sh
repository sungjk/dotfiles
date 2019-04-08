#!/usr/bin/env bash

echo "Setting up your Mac..."

mkdir -p $HOME/workspace

DOTFILES=$HOME/dotfiles

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file=$DOTFILES/Brewfile
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup

# Make ZSH the default shell environment
chsh -s $(which zsh)


#-------------------------------------------------------------------------------
# Install Oh-my-zsh
#-------------------------------------------------------------------------------

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install Powerline theme
# Neet to set font in iterm2 preferences
wget https://raw.githubusercontent.com/jeremyFreeAgent/oh-my-zsh-powerline-theme/master/powerline.zsh-theme -O $HOME/.oh-my-zsh/themes/powerline.zsh-theme
git clone git@github.com:powerline/fonts.git && bash fonts/install.sh
sleep 3
rm -rf fonts

git clone https://github.com/jhipster/jhipster-oh-my-zsh-plugin.git $HOME/.oh-my-zsh/custom/plugins/jhipster

# Install global NPM packages
npm install --global yarn

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -nfs $DOTFILES/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
rm -rf $HOME/.mackup.cfg
ln -nfs $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Ruby packages
gem install jekyll bundler

# Install global Git configuration
ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig
git config --global core.excludesfile $DOTFILES/.gitignore_global
git config --global user.name "sungjk"
git config --global user.email "ajax0615@gmail.com"

source $HOME/.zshrc
source $DOTFILES/.macos
