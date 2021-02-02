#!/bin/bash
# Installation script for my dotfiles
# NOTE: You need git and coreutils installed for this to work. Execute this script inside the directory it's in (i.e. `./install.sh` should work)
# NOTE: Having vim installed already along with xfce is a good idea

# Installing Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Linking bash config
ln -s ./.bashrc ~/.bashrc

# Linking input config
ln -s ./.inputrc ~/.inputrc

# Linking git config and adding it to git
ln -s ./.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Linking the terminalrc
ln -s ~/xfce/terminalrc ~/.config/xfce/terminal/terminalrc

# Printing a success message
echo 'Success! To finish up, run :VundleInstall within vim!'

