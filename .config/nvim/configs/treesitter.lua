pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  ensure_installed = {
    "lua",
    "luadoc",
    "printf",
    -- "vim",
    -- "vimdoc",
    "markdown",
    "markdown_inline",
    "python",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  injections = {
    enable = true,
  },

  indent = { enable = true },
}
