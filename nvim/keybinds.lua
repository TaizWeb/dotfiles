-- Switch to the previous buffer
vim.api.nvim_set_keymap("n", "-", ":bprevious<CR>", { noremap = true, silent = true })
-- Switch to the next buffer
vim.api.nvim_set_keymap("n", "=", ":bnext<CR>", { noremap = true, silent = true })
-- Move entire line and cursor down a line
vim.api.nvim_set_keymap("n", "<leader>j", ":m .+1<CR>==", { noremap = true, silent = true })
-- Move entire line and cursor up a line
vim.api.nvim_set_keymap("n", "<leader>k", ":m .-2<CR>==", { noremap = true, silent = true })
-- Toggle NvimTree with \e
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- Split vertically with \v
vim.api.nvim_set_keymap("n", "<leader>v", ":vs<CR>", { noremap = true, silent = true })
-- Split horizontally with \s
vim.api.nvim_set_keymap("n", "<leader>s", ":sp<CR>", { noremap = true, silent = true })
-- Reindent entire file and return to the original line (with F7)
vim.api.nvim_set_keymap("n", "<F7>", "gg=G<C-o><C-o>", { noremap = true, silent = true })
-- Use space to toggle folds
vim.api.nvim_set_keymap("n", "<Space>", "za", { noremap = true, silent = true })
-- Delete buffers with \d
vim.api.nvim_set_keymap("n", "<leader>d", ":bd<CR>:bprev<CR>", { noremap = true, silent = true })
-- Show output of Trouble to see all errors/warning in a file
vim.api.nvim_set_keymap("n", "<leader>t", ":Trouble diagnostics toggle<CR>", { noremap = true, silent = true })

-- Jump windows with CTRL-hjkl
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- And CTRL-arrow
vim.api.nvim_set_keymap("n", "<C-Left>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Down>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Up>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", "<C-w>l", { noremap = true, silent = true })

-- Fugitive Shorthand
-- gc, git commit
vim.api.nvim_set_keymap("n", "<leader>gc", ":G commit<CR>", { noremap = true, silent = true })
-- gp, git push
vim.api.nvim_set_keymap("n", "<leader>gp", ":G push<CR>", { noremap = true, silent = true })

-- Telescope bindings
local builtin = require("telescope.builtin")

-- Stuff I actually use
-- ff, find files
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- fg, find (via) grep
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- fs, find symbols
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
-- gs, git status
vim.keymap.set("n", "<leader>gs", builtin.git_status, {})

-- Recommended to me
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>ft", builtin.tags, {})
vim.keymap.set("n", "<leader>fp", builtin.treesitter, {})

-- Refactoring Mappings
-- re, refactor extract (block of code to a function)
vim.keymap.set("x", "<leader>re", ":Refactor extract ", {})
-- rv, refactor variable
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", {})
-- rr, refactor rename
vim.keymap.set("n", "<leader>rr", ":lua vim.lsp.buf.rename()<CR>", {})

-- Debug Mappings
-- db, debug breakpoint
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", {})
-- dc, debug continue
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", {})
-- do, debug (step) over
vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_over()<CR>", {})
-- di, debug (step) into
vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>", {})
-- ds, debug status
vim.keymap.set("n", "<leader>ds", ":lua require'dap'.repl.open()<CR>", {})
