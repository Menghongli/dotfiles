#! /bin/bash

set -euo pipefail

echo "Installing Homebrew if it's not installed..."
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Installing fish if it's not installed..."
if ! command -v fish &> /dev/null
then
    brew install fish
    echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
    chsh -s /opt/homebrew/bin/fish
    echo "Symbol link config.fish..."
    mkdir ~/.config/fish
    ln -s ~/code/dotfiles/config.fish ~/.config/fish/config.fish 
    ln -s ~/code/dotfiles/fish_plugins ~/.config/fish/fish_plugins 
fi

echo "Installing ripgrep if it's not installed..."
if ! command -v rg &> /dev/null
then
    brew install ripgrep
fi

echo "Installing fd if it's not installed..."
if ! command -v fd &> /dev/null
then
    brew install fd
fi

echo "Installing wget if it's not installed..."
if ! command -v wget &> /dev/null
then
    brew install wget
fi

echo "Installing rbenv if it's not installed..."
if ! command -v rbenv &> /dev/null
then
    brew install rbenv ruby-build
fi

if ! ruby -v | grep -q '3.2.1'
then
    echo "Installing Ruby 3.2.1..."
    brew install libyaml
    rbenv install 3.2.1
    rbenv global 3.2.1
fi

echo "Installing neovim for NeoVim..."
gem install neovim
gem update neovim

echo "Installing pyenv if it's not installed..."
if ! command -v pyenv &> /dev/null
then
    brew install pyenv
fi

if ! python -V | grep -q '3.9.4'
then
    echo "Installing Python 3.9.4..."
    pyenv install 3.9.4
    pyenv global 3.9.4
fi

echo "Installing pynvim for NeoVim..."
pip install pynvim


echo "Install nodenv if it's not installed..."
if ! command -v nodenv &> /dev/null
then
   brew install nodenv
fi

if ! node -v | grep -q '18.15.0'
then
    echo "Installing Node 18.15.0..."
    nodenv install 18.15.0
    nodenv global 18.15.0
fi

echo "Installing neovim for NeoVim..."
npm install -g neovim

echo "Install NeoVim if it's not installed..."
if ! command -v nvim &> /dev/null
then
    brew install neovim
    ln -s ~/code/dotfiles/nvim ~/.config/nvim
fi

echo "Install Tmux if it's not installed..."
if ! command -v tmux &> /dev/null
then
    brew install tmux
    ln -s ~/code/dotfiles/tmux.conf ~/.tmux.conf
fi

echo "Install bat if it's not installed..."
if ! command -v bat &> /dev/null
then
    brew install bat
fi

echo "Install stats if it's not installed..."
if ! command -v stats &> /dev/null
then
    brew install stats
fi

echo "Install nerd Font..."
brew tap homebrew/cask-fonts &&
brew install --cask font-dejavu-sans-mono-nerd-font


echo "Symbol link gitconfig..."
ln -sf ~/code/dotfiles/gitconfig ~/.gitconfig
