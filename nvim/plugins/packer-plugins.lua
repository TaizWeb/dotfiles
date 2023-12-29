-- Plugins
require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager
	use("navarasu/onedark.nvim") -- Colorscheme
	use("williamboman/mason.nvim") -- Package manager for linters/formatters/LSPs
	use("nvim-tree/nvim-tree.lua") -- File tree
	use("nvim-tree/nvim-web-devicons") -- With icons
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

	-- Hybrid my beloved
	use({
		"PHSix/nvim-hybrid",
	})

	use("tpope/vim-commentary") -- Enables a way to easily comment out lines/blocks
	use("tpope/vim-surround") -- Enables easy changing of surrounding characters
	use("tpope/vim-sleuth") -- Automatically match indent of current file

	-- Languages
	use("leafo/moonscript-vim") -- Moonscript
	use("tpope/vim-markdown") -- Markdown

	use("lukas-reineke/indent-blankline.nvim") -- Easily see which function you're in

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
	use("hrsh7th/nvim-cmp")

	-- Telescope, essentially a better ctrl-p
	-- NOTE: ripgrep and fd (from apt) should be installed as well
	use("nvim-lua/plenary.nvim") -- Dependency
	use("nvim-telescope/telescope-fzf-native.nvim") -- Fuzzy finder
	use("nvim-telescope/telescope.nvim") -- Telescope itself

	-- Lualine (airline)
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- Bufferline
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	-- Startup screen
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
end)
