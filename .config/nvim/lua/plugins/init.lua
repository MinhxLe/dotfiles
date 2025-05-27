return {
  -- import = "nvchad.blink.lazyspec",
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "williamboman/mason.nvim",
    opts = require 'configs.mason'
  },
  {
    "ibhagwan/fzf-lua",
    lazy = false,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
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
    "andymass/vim-matchup",
    lazy = false,
  },
  {
    "mileszs/ack.vim",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "jremmen/vim-ripgrep",
    lazy = false,
  },
  {
    "chentoast/marks.nvim",
    lazy = false,
  },
  {
    "jeetsukumaran/vim-pythonsense",
    lazy = false,
  },
  {
    "folke/flash.nvim",
    lazy = false,
    opts = require("configs.flash")
  },
  {
    "jpalardy/vim-slime",
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = require("configs.cmp"),
  -- },
  -- {
  --   "Saghen/blink.cmp",
  --   opts = require 'configs.cmp'
  -- },
  { import = "nvchad.blink.lazyspec" },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "Saghen/blink.cmp" },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "rebelot/kanagawa.nvim"
  },
  {
    "NoahTheDuke/vim-just",
    event = { "BufReadPre Justfile", "BufNewFile Justfile" },
  },
  -- plugins/quarto.lua
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    event = {
      "BufReadPre *.qmd",
      "BufNewFile *.qmd"
    },
    opts = {
      lspFeatures = {
        enabled = true,
        chunks = 'curly',
      },
      codeRunner = {
        enabled = true,
        default_method = 'slime',
      },
    },
  },
  -- {
  --   'kristijanhusak/vim-dadbod-ui',
  --   dependencies = {
  --     { 'tpope/vim-dadbod',                     lazy = true },
  --     { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  --   },
  --   cmd = {
  --     'DBUI',
  --     'DBUIToggle',
  --     'DBUIAddConnection',
  --     'DBUIFindBuffer',
  --   },
  --   init = function()
  --     -- Your DBUI configuration
  --     vim.g.db_ui_use_nerd_fonts = 1
  --   end,
  -- },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     provider = "claude",
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick",       -- for file_selector provider mini.pick
  --     "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua",            -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --   },
  -- },
}
