--type conform.options
local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		-- javascript = { "prettier" },
		css = {},
		html = {},
		python = { "ruff_format" },
		sh = { "shfmt" },
	},

	-- adding same formatter for multiple filetypes can look too much work for some
	-- instead of the above code you could just use a loop! the config is just a table after all!

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 200,
		lsp_fallback = false,
	},
}

require("conform").setup(options)
