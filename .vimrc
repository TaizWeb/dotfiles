" Vundle Settings
set nocompatible
filetype off
filetype indent on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Functionality
Plugin 'VundleVim/Vundle.vim' " Vim package manager
Plugin 'scrooloose/nerdTree' " Adds nerdTree menu
Plugin 'tpope/vim-commentary' " Enables a way to easily comment out lines/blocks
Plugin 'scrooloose/syntastic' " Lints files for errors
Plugin 'ciaranm/securemodelines'
Plugin 'ervandew/supertab' " Enables auto-completion via <TAB>
Plugin 'ctrlpvim/ctrlp.vim' " Displays a directory's files via ctrl-p
Plugin 'bling/vim-bufferline' " Displays buffers in the statusbar
Plugin 'MarcWeber/vim-addon-mw-utils' " SnipMate dependency
Plugin 'tomtom/tlib_vim' " SnipMate dependency
Plugin 'garbas/vim-snipmate' " SnipMate
Plugin 'honza/vim-snippets' " SnipMate
Plugin 'tpope/vim-surround.git' " Enables easy changing of surrounding characters
Plugin 'tpope/vim-fugitive' " Native Git support in vim

" Language Support
" Markdown
Plugin 'tpope/vim-markdown'

" HTML
Plugin 'othree/html5.vim'

" Pug
Plugin 'digitaltoad/vim-pug'

" CSS
Plugin 'hail2u/vim-css3-syntax'

" Stylus
Plugin 'wavded/vim-stylus'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

" Moonscript
Plugin 'leafo/moonscript-vim'

" Colorsheme Plugins
"Plugin 'tomasr/molokai' " molokai
"Plugin 'NLKNguyen/papercolor-theme' " PaperColor
Plugin 'w0ng/vim-hybrid' " hybrid
"Plugin 'chriskempson/base16-vim' " base16-default-dark
"Plugin 'altercation/vim-colors-solarized' " solarized
"Plugin 'joshdick/onedark.vim' " onedark
"Plugin 'blerins/flattown' " flattown
"Plugin 'KeitaNakamura/neodark.vim' " neodark
"Plugin 'danilo-augusto/vim-afterglow' " afterglow
"Plugin 'muellan/am-colors' " amcolors
"Plugin 'morhetz/gruvbox' " gruvbox

" GUI Plugins
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline' " Adds a bottom bar to vim
Plugin 'vim-airline/vim-airline-themes' " Adds themes to airline
Plugin 'edkolev/tmuxline.vim'

call vundle#end()

" Whitespace
set tabstop=2 " Making tabs take up 2 spaces
set softtabstop=2
set shiftwidth=2
set noexpandtab " In this house we use tabs
set smarttab
set autoindent
set smartindent
set cindent
set hidden " Jump buffers without having to save them first

" Searching
set hlsearch " Enables highlighted searching
set ignorecase " Ignore search case
set incsearch " Show incremental search results

" Folding
set foldmethod=indent " Set folds to use indents and not braces
set foldlevelstart=10 " Fold everything more than 10 indents long
set foldnestmax=5 " Limit the madness to 5 folds at most
set foldenable " Have files folded by default

" Misc
set lazyredraw
set backspace=indent,eol,start
set modeline " Set file specific modelines just in case
set wildmenu " Enables command completion via <TAB>
set noswapfile " Controversial I know

" Keybinds
" (- to go back a buffer, = to go forward)
nnoremap - :bprevious<CR>
nnoremap = :bnext<CR>
" Toggle NERDTree with F5
noremap <F5> :NERDTreeToggle<CR>
" Lucky number 7, reindents an entire file and puts you back at the line you executed it from. Protip, :set expandtab before doing this for spaces, :setnoexpandtab to convert to tabs
nnoremap <F7> gg=G<C-o><C-o>
" Use space to toggle folds
noremap <space> za

" Making vim recognise moonscript
autocmd BufNewFile,BufRead,BufReadPost *.moon set filetype=moon

" Language-specific Editor Settings
autocmd FileType haskell setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=0

" Set spellcheck on text and markdown files
autocmd FileType markdown setlocal spell
autocmd FileType text setlocal spell

" Commentary language support
autocmd FileType python setlocal commentstring=#\ %s

" Syntax and GUI
set number " Turns on line numbering
set showcmd " Show the in-progress command in the lower right corner
set cursorline " Lights up the current line
set relativenumber " We're going hardmode now
set title " Sets the title of the terminal to the edited file
set scrolloff=10 " Keep 10 lines above/below current line
set sidescrolloff=5 " Same as above but for the sides
syntax on
colorscheme hybrid
set background=dark " This is here for legacy reasons
set encoding=utf8
set laststatus=2
set list lcs=tab:\|\ " Add block indent lines

" gvim settings
set guioptions-=m  " Disables Menubar
set guioptions-=T  " Disables Toolbar
set guioptions-=r  " Disables Scrollbar
" set guifont='DejaVu_Sans_Mono_for_Powerline':h10
":cANSI:qDRAFT

" Remember folds on save/load
augroup remember_folds
	autocmd!
	autocmd BufWinLeave ?* mkview | filetype detect
	autocmd BufWinEnter ?* silent loadview | filetype detect
augroup END

" Airline Settings
let g:airline_theme='bubblegum' " Sets the airline theme
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" CtrlP Settings
let g:ctrlp_custom_ignore = 'node_modules\|.vscode\|Lib\|Include\|tcl\|.git/'
let g:ctrlp_show_hidden = 1 " Enable ctrl-p to show dotfiles

" Snipmate Settings
let g:snipMate = { 'snippet_version' : 1 }

" Commentary Settings
" Template: autocmd FileType apache setlocal commentstring=#\ %s

" Colorscheme Tweaks
highlight Normal guibg=NONE ctermbg=NONE " Fancy transparent background
highlight LineNr ctermfg=Grey " Make line numbers readable on said background

