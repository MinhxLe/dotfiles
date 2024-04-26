---@type MappingsTable
local M = {}

local utils = require("custom.utils")

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["fn"] = { ":let @+ = expand('%')<cr>", "Copy file path" },
		["cn"] = {
			":cn<cr>",
			":cn",
		},
		["cN"] = {
			":cn<cr>",
			":cN<cr>",
		},
		["fm"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"LSP formatting",
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
				require("fzf-lua").buffers()
			end,
			"fzf search buffer",
		},
		-- ["<C-g>"] = {
		-- 	function()
		-- 		require("fzf-lua").args()
		-- 	end,
		-- 	"fzf search args",
		-- },
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

M.lspconfig = {
	plugin = true,
	n = {
		["<leader>q"] = {
			function()
				vim.diagnostic.setqflist()
			end,
			"diagnostic setloclist",
		},
	},
}

M.tmux = {
	n = {
		["<leader>rr"] = {
			function()
				utils.send_to_tmux_pane("C-p")
			end,
		},
	},
}

M.python = {
	n = {
		["<leader>pb"] = { "iimport ipdb;ipdb.set_trace()  # noqa<Esc>" },
		["<leader>rp"] = {
			function()
				local pytest_command = "pytest -s " .. vim.fn.expand("%")
				utils.send_to_tmux_pane(pytest_command)
			end,
			"run pytest on current file in buffer",
		},
		["<leader>rpu"] = {
			function()
				local pytest_command = "pytest -s " .. vim.fn.expand("%") .. " -k " .. utils.get_python_function_name()
				utils.send_to_tmux_pane(pytest_command)
			end,
			"run pytest of current test on current file in buffer",
		},
	},
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
