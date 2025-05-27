-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- lspconfig.pyright.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     python = {
--       pythonPath = vim.fn.exepath("python"),
--     },
--   },
-- })

-- if you just want default config for the servers then put them in a table
local servers = {
  "pyright",
  "html",
  "cssls",
  "clangd",
  "bashls",
  "lua_ls",
  "terraformls",
  "ruff",
  "gopls",
  "golangci_lint_ls",
  "julials",
}

for _, lsp in ipairs(servers) do
  capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
  lspconfig[lsp].setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
  })
end
