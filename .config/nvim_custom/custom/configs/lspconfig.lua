local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- lspconfig.pylsp.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       configurationSources = { "flake8" },
--       plugins = {
--         pycodestyle = { enabled = false },
--         pylint = { enabled = false },
--         flake8 = { enabled = true },
--         yapf = { enabled = true },
--         autopep8 = { enabled = false },
--         black = { enabled = false },
--         ruff = { enabled = false },
--         rope = {
--           enabled = true,
--         },
--         rope_autoimport = {
--           enabled = false,
--         },
--         rope_completion = {
--           enabled = false,
--         },
--         ["pylsp-mypy"] = { enabled = true, live_mode = true, report_progress = true },
--       },
--     },
--   },
-- }
-- before this was basedpyright
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      pythonPath = vim.fn.exepath("python"),
    },
  },
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    tsserver = {
      autoImportFileExcludePatterns = { "antd", "react-i18next", "i18next", "cb/src" },
    },
  },
})

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "clangd",
  "bashls",
  "lua_ls",
  "terraformls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
