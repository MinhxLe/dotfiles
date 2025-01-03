---@type MappingsTable
local M = {}

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
		["<C-t>"] = {
			function()
				require("fzf-lua").files()
			end,
			"fzf search lines",
		},
		["<C-a>"] = {
			function()
				require("fzf-lua").grep_project({ rg_opts = "--hidden --no-ignore" })
			end,
			"fzf search lines",
		},
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
		["<leader>ft"] = {
			function()
				require("fzf-lua").files()
			end,
			"fzf search lines",
		},
		["<leader>fa"] = {
			function()
				require("fzf-lua").grep_project({ rg_opts = "--hidden --no-ignore" })
			end,
			"fzf search lines",
		},
		["<leader>fs"] = {
			function()
				require("fzf-lua").grep_project()
			end,
			"fzf search lines",
		},
		["<leader>fp"] = {
			function()
				require("fzf-lua").files()
			end,
			"fzf search files",
		},
		["<leader>ff"] = {
			function()
				require("fzf-lua").grep_curbuf()
			end,
			"fzf search buffer",
		},
		["<leader>fb"] = {
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

_TMUX_PANE_ID = _TMUX_PANE_ID or nil

M.tmux = {
	n = {
		["<leader>rr"] = {
			function()
				if not _TMUX_PANE_ID then
					local pane_id = vim.fn.input("Enter tmux pane ID: ")
					_TMUX_PANE_ID = pane_id
				end
				vim.fn.system("tmux send-keys -t " .. _TMUX_PANE_ID .. " C-p Enter")
			end,
		},
	},
}

M.python = {
	n = {
		["<leader>pb"] = { "iimport ipdb;ipdb.set_trace()  # noqa<Esc>" },
	},
}

M.nvim_treesitter_context = {
	n = {
		["[c"] = {
			function()
				require("treesitter-context").go_to_context()
			end,
		},
		["<leader>rp"] = {
			function()
				if not _TMUX_PANE_ID then
					local pane_id = vim.fn.input("Enter tmux pane ID: ")
					_TMUX_PANE_ID = pane_id
				end
				local pytest_command = "pytest -s " .. vim.fn.expand("%")
				vim.fn.system("tmux send-keys -t " .. _TMUX_PANE_ID .. " '" .. pytest_command .. "' Enter")
			end,
			"run pytest on current file in buffer",
		},
		["<leader>rpu"] = {
			function()
				if not _TMUX_PANE_ID then
					local pane_id = vim.fn.input("Enter tmux pane ID: ")
					_TMUX_PANE_ID = pane_id
				end
				local pytest_command = "pytest -s "
					.. vim.fn.expand("%")
					.. " -k "
					.. require("custom.utils").get_python_function_name()
				vim.fn.system("tmux send-keys -t " .. _TMUX_PANE_ID .. " '" .. pytest_command .. "' Enter")
			end,
			"run pytest of current test on current file in buffer",
		},
	},
}
M.trouble = {
	n = {
		["<leader>xx"] = {
			function()
				require("trouble").toggle()
			end,
		},
		["<leader>xw"] = {
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
		},
		["<leader>xd"] = {
			function()
				require("trouble").toggle("document_diagnostics")
			end,
		},
		["<leader>xq"] = {
			function()
				require("trouble").toggle("quickfix")
			end,
		},
		["<leader>xl"] = {
			function()
				require("trouble").toggle("loclist")
			end,
		},
		["gR"] = {
			function()
				require("trouble").toggle("lsp_references")
			end,
		},
	},
}

M.gp = {
	n = {
		["<C-g>i"] = { ":<C-u>'<,'>GpImplement<cr>", "GpImplement" },
	},
	v = {
		["<C-g>i"] = { ":<C-u>'<,'>GpImplement<cr>", "GpImplement" },
	},
}
return M
