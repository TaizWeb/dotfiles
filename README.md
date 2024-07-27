# dotfiles
These are a collection of my dotfiles used on my Linux machines.

## Suggested Packages
Before running the install script, you should make sure you have the following so you don't experience a bunch of "command not found" errors.

### APT
```bash
git # Used heavily in the install script
tmux # Sick terminal multiplexing
perl # Dependency for the cool tmux config
vim # My backup editor
fd  # NeoVim Telescope dependency
ripgrep # NeoVim Telescope dependency
xclip # Lets Vim/Tmux link with the system clipboard
pynvim # Helps NeoVim with interfacing with Python
python3-venv # Used by Mason to manage Python deps
node # Used by Mason to manage JS deps (linters and the like)
cowsay # Fun
fortune # Fun
```

### NeoVim
Good luck having a package manager that keeps this up to date. Install it manually with [NeoVim's Guide](https://github.com/neovim/neovim/blob/master/INSTALL.md#linux).

### Python/Pip
```bash
virtualenv # Used a lot in scripts to manage linters
```

### Lua/Luarocks
Most package managers suck about keeping Lua updated, might as well follow [this guide](https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix).

## Quick Installation
Run `./install.sh` while in the root of this repository.

## Manual Installation
Make symlinks of each of the desired files `ln -s ~/path/to/dotfiles/.filerc ~/.filerc`. See below for how to do this and wht dependencies the packages need.

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

## Contributing
Don't. Mostly. If I'm doing something terribly wrong in one of my rc files, feel free to make a pull request to amend it. As for suggesting actual changes (like telling me to stop being a heathen and use 8 space indentation) I would prefer you not to.
