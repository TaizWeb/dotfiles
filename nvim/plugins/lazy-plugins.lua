-- Plugins

local plugins = {
	{ "wbthomason/packer.nvim" }, -- Package manager
	{ "navarasu/onedark.nvim" }, -- Colorscheme
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "williamboman/mason.nvim" }, -- Package manager for linters/formatters/LSPs

	-- Tree sitter, basically improved syntax highlight
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "python", "vim", "lua", "javascript" },

				auto_install = true,
				highlight = {
					enable = true,
				},

				rainbow = {
					enable = true,
					disable = { "html" },
					query = "rainbow-parens",
					hlgroups = {
						"TSRainbowCyan",
						"TSRainbowYellow",
						"TSRainbowBlue",
						"TSRainbowOrange",
						"TSRainbowGreen",
						"TSRainbowViolet",
						"TSRainbowRed",
					},
					-- Highlight the entire buffer all at once
				},
			})
		end,
		-- build = ":TSUpdate && :TSInstall comment",
	},

	-- Git
	{ "tpope/vim-fugitive" }, -- Native Git support in vim
	{ "lewis6991/gitsigns.nvim" }, -- Pretty GUI stuff

	-- Assorted
	{ "tpope/vim-commentary" }, -- Enables a way to easily comment out lines/blocks
	{ "tpope/vim-surround" }, -- Enables easy changing of surrounding characters
	{ "tpope/vim-sleuth" }, -- Automatically match indent of current file

	-- Language support
	{ "leafo/moonscript-vim" }, -- Moonscript
	{ "tpope/vim-markdown" }, -- Markdown

	-- Formatters, linters, and LSPs
	-- { "neovim/nvim-lspconfig", opts = { inlay_hints = { enabled = true } } }, -- LSP support
	{ "neovim/nvim-lspconfig" }, -- LSP support
	{ "mfussenegger/nvim-lint" }, -- Autorun linters
	{ "mhartington/formatter.nvim" }, -- Autorun formatters
	{ "folke/trouble.nvim" }, -- Get a list of errors

	-- Snippets
	{ "L3MON4D3/LuaSnip" }, -- Snippet engine
	{ "rafamadriz/friendly-snippets" }, -- Assorted snippets

	-- Autodocstring
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({
				enabled = true,
				languages = {
					python = {
						template = {
							annotation_convention = "numpydoc",
						},
					},
				},
			})
		end,
	},

	-- Autocompletion
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "saadparwaiz1/cmp_luasnip" }, -- Compat
	{ "hrsh7th/nvim-cmp" }, -- Completion engine

	-- Telescope, essentially a better ctrl-p
	{ "nvim-lua/plenary.nvim" }, -- Dependency
	{ "nvim-telescope/telescope-fzf-native.nvim" }, -- Fuzzy finder
	{ "nvim-telescope/telescope.nvim" }, -- Telescope itself

	-- GUI
	{ "nvim-tree/nvim-tree.lua" }, -- File tree
	{ "nvim-tree/nvim-web-devicons" }, -- With icons
	-- Easily see which function you're in by coloring scopes
	{ "lukas-reineke/indent-blankline.nvim" },
	-- Bufferline, or the tabs on top
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	-- An airline-like plugin
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	-- Rainbow parenthesis
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		name = "nvim-ts-rainbow2",
	},
	-- Inlay hints
	{
		"MysticalDevil/inlay-hints.nvim",
		event = "LspAttach",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("inlay-hints").setup()
		end,
	},

	-- Startup screen
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
}

return plugins
