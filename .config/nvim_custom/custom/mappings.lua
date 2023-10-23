---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>fn"] = { ":let @+ = expand('%')<cr>", "Copy file path" },
    ["cn"] = {
      ":cn<cr>",
      ":cn",
    },
    ["cN"] = {
      ":cn<cr>",
      ":cN<cr>",
    },
  },
}

-- more keybinds!
M.comment = {
  plugin = true,
  -- toggle comment in both modes
  n = {
    ["<leader>cc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },
  v = {
    ["<leader>cc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.fzf = {
  n = {
    ["<C-s>"] = {
      function()
        require("fzf-lua").grep_project()
      end,
      "fzf search lines",
    },
    ["<C-p>"] = {
      function()
        require("fzf-lua").files()
      end,
      "fzf search files",
    },
    ["<C-f>"] = {
      function()
        require("fzf-lua").grep_curbuf()
      end,
      "fzf search buffer",
    },
    ["<C-b>"] = {
      function()
        require("fzf-lua").buffer()
      end,
      "fzf search buffer",
    },
    -- ["<C-q>"] = {
    --   "<ESC><cmd>lua require('fzf-lua').lsp_workspace_diagnostics()<CR>",
    --   "fzf search lsp diagnostics",
    -- },
    -- ["<C-h>"] = {
    --   "<ESC><cmd>lua require('fzf-lua').command_history()<CR>",
    --   "fzf search history"
    -- },
  },
}

-- M.lspconfig = {
--   plugin = true,
--   n = {
--     ["gd"] = {
--       function()
--         vim.cmd "vsplit"
--         vim.lsp.buf.definition()
--       end,
--       "lsp definition",
--     },
--   },
-- }
M.pytest = {
  n = {
    -- ["pta"] = {
    --   function()
    --     vim.cmd ':exe "!tmux send -t 2 \'pytest \'" . "  Enter"'
    --   end,
    --   "run pytest on current file in buffer",
    -- },
    ["<leader>rp"] = {
      function()
        vim.cmd ":silent exe \"!tmux send -t 2 'pytest -n0 -s \" . expand('%') .  \" ' Enter\""
      end,
      "run pytest on current file in buffer",
    },
  },
}

M.cli = {

}

M.nvim_treesitter_context = {
  n = {
    ["[c"] = {
      function()
        require("treesitter-context").go_to_context()
      end,
    },
  },
}

return M
