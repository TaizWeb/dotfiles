-- Execute linters and formatters on write
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
		vim.cmd(":FormatWrite")
	end,
})

-- Remember folds on save/load
vim.cmd("augroup remember_folds")
vim.cmd("autocmd!")
vim.cmd("autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!")
vim.cmd("autocmd BufWinEnter ?* silent! loadview")
vim.cmd("augroup END")

-- Language-specific
-- Making vim recognise moonscript
vim.cmd("autocmd BufNewFile,BufRead,BufReadPost *.moon set filetype=moon")

-- Language-specific Editor Settings
vim.cmd("autocmd FileType haskell setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=0")

-- Set spellcheck on text and markdown files
vim.cmd("autocmd FileType markdown setlocal spell")
vim.cmd("autocmd FileType text setlocal spell")

-- Commentary language support
vim.cmd("autocmd FileType python setlocal commentstring=#\\ %s")
vim.cmd("autocmd FileType dart setlocal commentstring=//\\ %s")
