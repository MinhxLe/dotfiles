return {
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
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "ibhagwan/fzf-lua",
    lazy = false,
  },
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
      require("configs.flash")
    end,
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
  {
    "hrsh7th/nvim-cmp",
    opts = require("configs.cmp"),
  },
  {
    "olimorris/onedarkpro.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "yetone/avante.nvim",
    -- config = function()
    --   require("custom.configs.avante")
    -- end,
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      vendors = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
        },
      },
      provider = "deepseek",
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",      -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "echasnovski/mini.files",
    lazy = false,
    config = function()
      require("mini.files").setup()
    end,
  },
  {
    "NoahTheDuke/vim-just",
    lazy = false,
  },
}
