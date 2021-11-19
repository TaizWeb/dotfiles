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

# Linking vimrc
ln -s ./.vimrc ~/.vimrc

# Linking git config and adding it to git
ln -s ./.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Linking the terminalrc
# I notice this alternates between using xfce and xfce4?
ln -s ~/xfce/terminalrc ~/.config/xfce4/terminal/terminalrc

# Printing a success message
echo 'Success! To finish up, run :VundleInstall within vim!'

