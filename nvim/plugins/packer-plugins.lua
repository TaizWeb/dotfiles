-- Plugins
local M = {}

function M.setup(packer)
	packer.startup(function(use)
		use("wbthomason/packer.nvim") -- Package manager
		use("navarasu/onedark.nvim") -- Colorscheme
		use({ "catppuccin/nvim", as = "catppuccin" })
		use("williamboman/mason.nvim") -- Package manager for linters/formatters/LSPs

		-- Tree sitter, basically improved syntax highlight
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate && :TSInstall comment",
		})

		-- Git
		use("tpope/vim-fugitive") -- Native Git support in vim
		use("lewis6991/gitsigns.nvim") -- Pretty GUI stuff

		-- Assorted
		use("tpope/vim-commentary") -- Enables a way to easily comment out lines/blocks
		use("tpope/vim-surround") -- Enables easy changing of surrounding characters
		use("tpope/vim-sleuth") -- Automatically match indent of current file

		-- Language support
		use("leafo/moonscript-vim") -- Moonscript
		use("tpope/vim-markdown") -- Markdown

		-- Debugging
		use("mfussenegger/nvim-dap")
		use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
		use("theHamsta/nvim-dap-virtual-text")

		-- Formatters, linters, and LSPs
		use({ "neovim/nvim-lspconfig", opts = { inlay_hints = { enabled = true } } }) -- LSP support
		-- use("neovim/nvim-lspconfig") -- LSP support
		use("mfussenegger/nvim-lint") -- Autorun linters
		use("mhartington/formatter.nvim") -- Autorun formatters
		use("folke/trouble.nvim") -- Get a list of errors

		-- Snippets
		use("L3MON4D3/LuaSnip") -- Snippet engine
		use("rafamadriz/friendly-snippets") -- Assorted snippets

		-- Autodocstring
		use({
			"danymat/neogen",
			config = function()
				require("neogen").setup({})
			end,
		})

		-- Autocompletion
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("saadparwaiz1/cmp_luasnip") -- Compat
		use("hrsh7th/nvim-cmp") -- Completion engine

		-- Telescope, essentially a better ctrl-p
		use("nvim-lua/plenary.nvim") -- Dependency
		use("nvim-telescope/telescope-fzf-native.nvim") -- Fuzzy finder
		use("nvim-telescope/telescope.nvim") -- Telescope itself

		-- GUI
		use("nvim-tree/nvim-tree.lua") -- File tree
		use("nvim-tree/nvim-web-devicons") -- With icons
		-- Easily see which function you're in by coloring scopes
		use("lukas-reineke/indent-blankline.nvim")
		-- Bufferline, or the tabs on top
		use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
		-- An airline-like plugin
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons", opt = true },
		})
		-- Rainbow parenthesis
		use({
			"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
			as = "nvim-ts-rainbow2",
		})

		-- Startup screen
		use({
			"goolord/alpha-nvim",
			requires = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("alpha").setup(require("alpha.themes.startify").config)
			end,
		})
	end)
end

return M
