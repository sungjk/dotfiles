#!/usr/bin/env bash

git pull origin master;

echo "Setting up your Mac..."

mkdir -p $HOME/workspace

DOTFILES=$HOME/dotfiles

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/jhipster/jhipster-oh-my-zsh-plugin.git $HOME/.oh-my-zsh/custom/plugins/jhipster

git clone https://github.com/powerline/fonts.git --depth=1
cp -r $DOTFILES/.fonts/ $HOME/Library/Fonts

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
