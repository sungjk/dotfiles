#!/usr/bin/env bash

echo "Setting up your Mac..."

DOTFILES=$HOME/dotfiles

mkdir -p $HOME/workspace
mkdir -p $HOME/go/{bin,src,pkg}


#-------------------------------------------------------------------------------
# Homebrew
#-------------------------------------------------------------------------------
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure brew is in PATH (Apple Silicon)
eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null)"

source $DOTFILES/brew.sh
source $DOTFILES/brew-cask.sh


#-------------------------------------------------------------------------------
# Zsh + Oh My Zsh
#-------------------------------------------------------------------------------
chsh -s $(which zsh)

ZSH=$HOME/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chown -R $(whoami) $ZSH

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $ZSH/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH/custom/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH/custom/plugins/zsh-syntax-highlighting

# Powerlevel10k
brew install powerlevel10k
ln -sf $(brew --prefix)/share/powerlevel10k $ZSH/custom/themes/powerlevel10k


#-------------------------------------------------------------------------------
# Symlinks
#-------------------------------------------------------------------------------
# Zsh
rm -rf $HOME/.zshrc
ln -nfs $DOTFILES/.zshrc $HOME/.zshrc
ln -nfs $DOTFILES/.p10k.zsh $HOME/.p10k.zsh

# Git
ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig
git config --global core.excludesfile $DOTFILES/.gitignore_global
git config --global user.name "sungjk"
git config --global user.email "ajax0615@gmail.com"

# Ghostty
mkdir -p $HOME/.config/ghostty
ln -nfs $DOTFILES/.ghostty-config $HOME/.config/ghostty/config

# Misc
ln -nfs $DOTFILES/.editorconfig $HOME/.editorconfig
ln -nfs $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# fzf keybindings
$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish


#-------------------------------------------------------------------------------
# macOS defaults
#-------------------------------------------------------------------------------
source $DOTFILES/.macos


#-------------------------------------------------------------------------------
# Etc
#-------------------------------------------------------------------------------
mkdir -p $HOME/.aws
touch $HOME/.aws/credentials
touch $HOME/.aws/config
mkdir -p $HOME/.gradle
gem install --user-install jekyll bundler
pip3 install --user Pygments

# Remind to create .env
if [ ! -f $DOTFILES/.env ]; then
  echo ""
  echo "WARNING: Create $DOTFILES/.env with your tokens"
fi

echo ""
echo "Done. Restart your terminal or run: exec zsh"
