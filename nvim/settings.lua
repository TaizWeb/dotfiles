-- luacheck: ignore vim

-- Syntax and GUI
vim.o.number = true -- Turns on line numbering
vim.o.showcmd = true -- Show the in-progress command in the lower right corner
vim.o.cursorline = true -- Lights up the current line
vim.o.relativenumber = true -- We're going hardmode now
vim.o.title = true -- Sets the title of the terminal to the edited file
vim.o.scrolloff = 10 -- Keep 10 lines above/below current line
vim.o.sidescrolloff = 5 -- Same as above but for the sides
vim.o.background = "dark" -- This is here for legacy reasons
vim.o.encoding = "utf8"
vim.o.laststatus = 2
vim.cmd("syntax on")
-- vim.cmd("colorscheme hybrid")
-- set list lcs=tab:\|\ -- Add block indent lines

-- Whitespace
vim.o.tabstop = 2 -- Define tabs 2 spaces thick
vim.o.softtabstop = 2
vim.o.expandtab = true -- I use spaces now
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.cindent = true -- Support C while we're at it
vim.o.hidden = true
-- Searching
vim.o.hlsearch = true -- Highlight search results
vim.o.ignorecase = true -- Case insensitive
vim.o.incsearch = true -- Incrementable search results

-- Folds
vim.o.foldmethod = "indent" -- Set folds to use indents and not braces
vim.o.foldlevelstart = 10 -- Fold everything more than 10 indents long
vim.o.foldnestmax = 5 -- Limit the madness to 5 folds at most
vim.o.foldenable = true -- Have files folded by default

-- Misc
vim.o.lazyredraw = true
vim.o.backspace = "indent,eol,start"
vim.o.modeline = true -- Set file specific modelines just in case
vim.o.wildmenu = true -- Enables command completion via <TAB>
vim.o.noswapfile = true -- Controversial I know
