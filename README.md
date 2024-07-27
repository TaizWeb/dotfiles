# dotfiles
These are a collection of my dotfiles used on my Linux machines.

## Dumb Installation
### Vim (.vimrc)
* Place the file in your home directory, for example, `~/.vimrc`
* You will also need [Vundle](https://github.com/VundleVim/Vundle.vim)
* Install it with ``git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim``
* Following that, open a new vim session and enter ``:VundleInstall`` to grab the plugins

### NeoVim
* Copy the nvim folder to your `~/.config` folder
* You will also need [Packer](https://github.com/wbthomason/packer.nvim)

#### Packer
1. Install it with ``git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim``
2. Following that, open a new nvim session and enter ``:PackerInstall`` to grab the plugins

#### TODO Highlighting
Run `:TSInstall comment`

#### Telescope Fuzzy Searching
Install `ripgrep` and `fd` from apt

#### Mason (Linters/Formatters/LSPs)
Currently used Mason packages are:
##### Python
* black
* pylint
* python-lsp-server
* isort

##### Web
* eslint-lsp
* eslint_d
* css-lsp
* prettier

##### Lua
* lua-language-server
* luacheck
* luaformatter
* stylua

##### C
* clang-format
* clangd

### Bash (.bashrc)
* Place the file in your home directory, for example `~/.bashrc`

### Git (.gitignore\_global)
* Place the file in your home directory, for example `~/.gitignore\_global`
* Run `git config --global core.excludesfile ~/.gitignore\_global`

### Input (.inputrc)
* Place the file in your home directory, for example `~/.inputrc`

### XFCE Terminal (xfce/terminalrc)
* Place the file in `~/.config/xfce/terminal/terminalrc`
Note: Sometimes this folder is called "xfce4" instead of "xfce"

## Smart Installation
* Clone the repository: `git clone https://github.com/taizweb/dotfiles.git`
* Make a symlink of the desired file `ln -s ~/path/to/dotfiles/.filerc ~/.filerc` (You may have to look at the Dumb Installation to know where to place the dotfiles, but most go in your home directory).

## Contributing
Don't. Mostly. If I'm doing something terribly wrong in one of my rc files, feel free to make a pull request to amend it. As for suggesting actual changes (like telling me to stop being a heathen and use 8 space indentation) I would prefer you not to.
