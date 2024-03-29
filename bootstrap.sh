#!/usr/bin/env bash

git pull origin master;

echo "Setting up your Mac..."

mkdir -p $HOME/workspace
mkdir -p $HOME/go/{bin,src,pkg}

DOTFILES=$HOME/dotfiles

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make ZSH the default shell environment
chsh -s $(which zsh)


#-------------------------------------------------------------------------------
# Install zsh
#-------------------------------------------------------------------------------
ZSH=$HOME/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $ZSH/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH/custom/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/jhipster/jhipster-oh-my-zsh-plugin.git $ZSH/custom/plugins/jhipster

brew install wget
wget https://raw.githubusercontent.com/jeremyFreeAgent/oh-my-zsh-powerline-theme/master/powerline.zsh-theme -O $ZSH/themes/powerline.zsh-theme
git clone https://github.com/powerline/fonts.git && bash fonts/install.sh
sleep 3
rm -rf fonts

cp -r $DOTFILES/.fonts/ /Library/Fonts

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -nfs $DOTFILES/.zshrc $HOME/.zshrc


#-------------------------------------------------------------------------------
# Install global Git configuration
#-------------------------------------------------------------------------------
ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig
git config --global core.excludesfile $DOTFILES/.gitignore_global
git config --global user.name "sungjk"
git config --global user.email "ajax0615@gmail.com"


#-------------------------------------------------------------------------------
# Source profile
#-------------------------------------------------------------------------------
source $HOME/.zshrc
source $DOTFILES/.macos
# Symlink the Mackup config file to the home directory
rm -rf $HOME/.mackup.cfg
ln -nfs $DOTFILES/.mackup.cfg $HOME/.mackup.cfg
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install


#-------------------------------------------------------------------------------
# Etc
#-------------------------------------------------------------------------------
mkdir -p $HOME/.aws
touch $HOME/.aws/credentials
touch $HOME/.aws/config
mkdir -p $HOME/.gradle
gem install jekyll bundler

# To show file changes in git
pip3 install Pygments
