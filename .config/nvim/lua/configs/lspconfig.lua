-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

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

-- if you just want default config for the servers then put them in a table
local servers = {
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
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
