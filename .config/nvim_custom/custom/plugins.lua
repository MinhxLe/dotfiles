local overrides = require("custom.configs.overrides")
---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      -- require("plugins.configs.lspconfig")
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
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "hrsh7th/nvim-cmp",
  },
  -- [TODO] move to seperate module
  -- {
  --   "saghen/blink.cmp",
  --   -- optional: provides snippets for the snippet source
  --   dependencies = "rafamadriz/friendly-snippets",
  --
  --   -- use a release tag to download pre-built binaries
  --   version = "*",
  --   -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  --   -- build = 'cargo build --release',
  --   -- If you use nix, you can build from source using latest nightly rust with:
  --   -- build = 'nix run .#build-plugin',
  --   opts = {
  --     -- 'default' for mappings similar to built-in completion
  --     -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
  --     -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
  --     -- See the full "keymap" documentation for information on defining your own keymap.
  --     keymap = { preset = "super-tab", cmdline = { preset = "default" } },
  --
  --     appearance = {
  --       -- Sets the fallback highlight groups to nvim-cmp's highlight groups
  --       -- Useful for when your theme doesn't support blink.cmp
  --       -- Will be removed in a future release
  --       use_nvim_cmp_as_default = true,
  --       -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
  --       -- Adjusts spacing to ensure icons are aligned
  --       nerd_font_variant = "mono",
  --     },
  --
  --     -- Default list of enabled providers defined so that you can extend it
  --     -- elsewhere in your config, without redefining it, due to `opts_extend`
  --     sources = {
  --       default = { "lsp", "path", "snippets", "buffer" },
  --     },
  --     completion = {
  --       list = {
  --         selection = "auto_insert",
  --       },
  --     },
  --   },
  --   opts_extend = { "sources.default" },
  -- },
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
    config = function()
      require('fzf-lua').setup({
        winopts = {
          -- Set split to use a regular split instead of popup
          -- Options:
          -- "new" : split below
          -- "aboveleft new" : split above
          -- "vnew" : split right
          -- "aboveleft vnew" : split left
          split = "aboveleft new" -- This will create a horizontal split below
        }
      })
    end,

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
    "robitx/gp.nvim",
    lazy = false,
    config = function()
      require("custom.configs.gp")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    -- TODO figure out how to extend sources
    opts = require("custom.configs.cmp"),
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
  {
    "Julian/lean.nvim",
    lazy = false,
    opts = {
      mapping = true,
    },
  },
  -- TODO https://github.com/benlubas/molten-nvim
  -- {
  --   "benlubas/molten-nvim",
  -- },
  -- {
  --   "epwalsh/obsidian.nvim",
  --   lazy = false,
  --   config = function()
  --     require("obsidian").setup({
  --       workspaces = {
  --         {
  --           name = "personal",
  --           path = "~/obsidian/minh",
  --         },
  --       },
  --     })
  --   end,
  -- }
}

return plugins
