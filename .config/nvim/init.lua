vim.g.theme = "onedark"
vim.g.theme_toggle = { "onedark", "one_light" }

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)


-- TODO organize this
local g = vim.g

-- TODO figure out how to modularize
vim.g.highlightedyank_highlight_duration = 50
vim.fn.setenv("FZF_DEFAULT_COMMAND", 'ag -g ""')

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

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(ctx)
    vim.fn.mkdir(vim.fn.fnamemodify(ctx.file, ":p:h"), "p")
  end,
})

vim.cmd("let $FZF_DEFAULT_OPTS = '--bind tab:down,shift-tab:up'")


vim.api.nvim_create_user_command("UpdateTmuxPaneId",
  function()
    local pane_id = vim.fn.input("Enter tmux pane ID: ")
    _TMUX_PANE_ID = pane_id
  end, {}
)
vim.g.slime_target = "tmux"

vim.g.slime_python_ipython = 1
