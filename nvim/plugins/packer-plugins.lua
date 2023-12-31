-- Plugins
require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager
	use("navarasu/onedark.nvim") -- Colorscheme
	use("williamboman/mason.nvim") -- Package manager for linters/formatters/LSPs

	-- Tree sitter, basically improved syntax highlight
	-- NOTE: You will need to run :TSInstall comment for TODO highlighting)
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("HiPhish/nvim-ts-rainbow2") -- Rainbow parenthesis

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

	-- Formatters, linters, and LSPs
	use("neovim/nvim-lspconfig") -- LSP support
	use("mfussenegger/nvim-lint") -- Autorun linters
	use("mhartington/formatter.nvim") -- Autorun formatters
	use("folke/trouble.nvim") -- Get a list of errors

	-- Autocompletion
	use("L3MON4D3/LuaSnip") -- Snippet engine
	use("rafamadriz/friendly-snippets") -- Assorted snippets
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip") -- Compat
	use("hrsh7th/nvim-cmp") -- Completion engine

	-- Telescope, essentially a better ctrl-p
	-- NOTE: ripgrep and fd (from apt) should be installed as well
	use("nvim-lua/plenary.nvim") -- Dependency
	use("nvim-telescope/telescope-fzf-native.nvim") -- Fuzzy finder
	use("nvim-telescope/telescope.nvim") -- Telescope itself

	-- GUI
	use("nvim-tree/nvim-tree.lua") -- File tree
	use("nvim-tree/nvim-web-devicons") -- With icons
	use("lukas-reineke/indent-blankline.nvim") -- Easily see which function you're in

	use({
		"nvim-lualine/lualine.nvim", -- An airline-like plugin
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" }) -- Bufferline

	-- Startup screen
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
end)
