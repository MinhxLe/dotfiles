local compare = require('cmp.config.compare')
local opts = {
  sources = {
    { name = "nvim_lsp",   priority = 8 },
    { name = "buffer",     priority = 7 },
    { name = "nvim_lua",   priority = 6 },
    { name = "async_path", priority = 7 },
    -- { name = "luasnip", priority = 2 },
    --
    per_filetype = {
      sql = { 'dadbod', 'buffer' },
    },
    providers = {
      dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
    },
  },
  sorting = {
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.locality,
      -- compare.scope,
      compare.kind,
      compare.sort_text,
      -- compare.length,
      -- compare.order,
    },
  },
}

return opts
