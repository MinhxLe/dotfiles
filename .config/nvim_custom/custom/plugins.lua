local overrides = require "custom.configs.overrides"
---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"

      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          }
          vim.diagnostic.open_float(nil, opts)
        end,
      })
    end, -- Override to setup mason-lspconfig
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
  -- {
  --   "junegunn/fzf",
  --   lazy = false,
  -- },
  -- {
  --   "junegunn/fzf.vim",
  --   lazy = false,
  -- },
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
      require("treesitter-context").setup {
        max_lines = 3,
      }
    end,
  },
  {
    "ayu-theme/ayu-vim",
  },
  {
    "jremmen/vim-ripgrep",
    lazy = false,
  },
  {
    "vim-test/vim-test",
    lazy = false,
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup {}
    end,
    lazy = false,
  },
  {
    "mileszs/ack.vim",
    lazy = false,
  },
  {
    "jeetsukumaran/vim-pythonsense",
    lazy = false,
  },
  -- {
  --   "HampusHauffman/block.nvim",
  --   config = function()
  --     require("block").setup {}
  --   end,
  --   lazy = false,
  -- },

  -- {
  --   "chaoren/vim-wordmotion",
  --   lazy = false,
  -- },
  -- {
  --   "ludovicchabant/vim-gutentags",
  --   lazy = false,
  -- },
}

return plugins
