local overrides = require("custom.configs.overrides")
---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		config = function()
			require("custom.configs.conform")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
	},
	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"tpope/vim-eunuch",
		lazy = false,
	},
	{
		"tpope/vim-fugitive",
		lazy = false,
	},
	{
		"tpope/vim-rhubarb",
		lazy = false,
	},
	{
		"machakann/vim-highlightedyank",
		lazy = false,
	},
	{
		"ibhagwan/fzf-lua",
		lazy = false,
	},
	{
		"andymass/vim-matchup",
		lazy = false,
	},
	{
		"mileszs/ack.vim",
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
			},
		},
		config = function()
			require("treesitter-context").setup({
				max_lines = 3,
			})
		end,
	},
	{
		"jremmen/vim-ripgrep",
		lazy = false,
	},
	{
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({})
		end,
		lazy = false,
	},
	{
		"jeetsukumaran/vim-pythonsense",
		lazy = false,
	},
	{
		"folke/flash.nvim",
		lazy = false,
		config = function()
			require("custom.configs.flash")
		end,
	},
	-- {
	--   "Exafunction/codeium.nvim",
	--   lazy = false,
	-- },
}

return plugins
