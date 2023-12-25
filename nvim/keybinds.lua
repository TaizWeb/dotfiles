-- Switch to the previous buffer
vim.api.nvim_set_keymap("n", "-", ":bprevious<CR>", { noremap = true, silent = true })
-- Switch to the next buffer
vim.api.nvim_set_keymap("n", "=", ":bnext<CR>", { noremap = true, silent = true })
-- Toggle NERDTree with F5
vim.api.nvim_set_keymap("n", "<F5>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- Reindent entire file and return to the original line (with F7)
vim.api.nvim_set_keymap("n", "<F7>", "gg=G<C-o><C-o>", { noremap = true, silent = true })
-- Use space to toggle folds
vim.api.nvim_set_keymap("n", "<Space>", "za", { noremap = true, silent = true })

-- Telescope bindings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>ft", builtin.tags, {})
vim.keymap.set("n", "<leader>fp", builtin.treesitter, {})
