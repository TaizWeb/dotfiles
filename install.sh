#!/bin/bash
# Installation script for my dotfiles
# NOTE: You need git and coreutils installed for this to work. Execute this script inside the directory it's in (i.e. `./install.sh` should work)
# NOTE: Having vim installed already along with xfce is a good idea

# Function to prompt user and create symlink
create_symlink() {
    local source=$1
    local target=$2

    if [ -e "$target" ]; then
        read -p "$target already exists. Overwrite with symlink? (y/n): " choice
        if [ "$choice" = "y" ]; then
            ln -sf "$source" "$target"
            echo "Overwritten $target"
        else
            echo "Skipped $target"
        fi
    else
        ln -s "$source" "$target"
        echo "Linked $target"
    fi
}

# Installing Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Installing Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Linking bash config
create_symlink "$(pwd)/.bashrc" ~/.bashrc

# Linking input config
create_symlink "$(pwd)/.inputrc" ~/.inputrc

# Linking vim config
create_symlink "$(pwd)/.vimrc" ~/.vimrc

# Linking nvim config
create_symlink "$(pwd)/nvim" ~/.config/nvim

# Linking tmux config
create_symlink "$(pwd)/.tmux.conf" ~/.tmux.conf
create_symlink "$(pwd)/.tmux.conf.local" ~/.tmux.conf.local

# Linking git config and adding it to git
create_symlink "$(pwd)/.gitignore_global" ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Creating target directory if it doesn't exist and linking the terminalrc
mkdir -p ~/.config/xfce4/terminal
create_symlink "$(pwd)/xfce/terminalrc" ~/.config/xfce4/terminal/terminalrc

# Install dependencies on startup
nvim --headless -u packer_install.lua
nvim -c "luafile mason_install.lua"

# Printing a success message
echo 'Success!'
