require "nvchad.mappings"

-- add your mappings here
local map = vim.keymap.set

-- General mappings
map("n", ";", ":", { desc = "enter command mode", nowait = true })
map("n", "fn", ":let @+ = expand('%')<cr>", { desc = "Copy file path" })
map("n", "cn", ":cn<cr>", { desc = ":cn" })
map("n", "cN", ":cN<cr>", { desc = ":cN" })
map("n", "fm", function() vim.lsp.buf.format({ async = true }) end, { desc = "LSP formatting" })

-- Comment plugin mappings
map("n", "<leader>cc", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>cc", "gc", { desc = "toggle comment", remap = true })

-- FZF mappings
map("n", "<C-t>", function() require("fzf-lua").files() end, { desc = "fzf search lines" })
map("n", "<C-a>", function() require("fzf-lua").grep_project({ rg_opts = "--hidden --no-ignore" }) end,
  { desc = "fzf search lines" })
map("n", "<C-s>", function() require("fzf-lua").grep_project() end, { desc = "fzf search lines" })
map("n", "<C-p>", function() require("fzf-lua").files() end, { desc = "fzf search files" })
map("n", "<C-f>", function() require("fzf-lua").grep_curbuf() end, { desc = "fzf search buffer" })
map("n", "<C-b>", function() require("fzf-lua").buffers() end, { desc = "fzf search buffer" })
map("n", "<leader>ft", function() require("fzf-lua").files() end, { desc = "fzf search lines" })
map("n", "<leader>fa", function() require("fzf-lua").grep_project({ rg_opts = "--hidden --no-ignore" }) end,
  { desc = "fzf search lines" })
map("n", "<leader>fs", function() require("fzf-lua").grep_project() end, { desc = "fzf search lines" })
map("n", "<leader>fp", function() require("fzf-lua").files() end, { desc = "fzf search files" })
map("n", "<leader>ff", function() require("fzf-lua").grep_curbuf() end, { desc = "fzf search buffer" })
map("n", "<leader>fb", function() require("fzf-lua").buffers() end, { desc = "fzf search buffer" })

-- LSP config mappings
map("n", "<leader>q", function() vim.diagnostic.setqflist() end, { desc = "diagnostic setloclist" })

-- Tmux integration mappings
_TMUX_PANE_ID = _TMUX_PANE_ID or nil
map("n", "<leader>rr", function()
  if not _TMUX_PANE_ID then
    local pane_id = vim.fn.input("Enter tmux pane ID: ")
    _TMUX_PANE_ID = pane_id
  end
  vim.fn.system("tmux send-keys -t " .. _TMUX_PANE_ID .. " C-p Enter")
end, { desc = "Run last command in tmux pane" })

-- Python development mappings
map("n", "<leader>pb", "iimport ipdb;ipdb.set_trace()  # noqa<Esc>", { desc = "Insert Python debugger" })

-- Treesitter context mappings
map("n", "[c", function() require("treesitter-context").go_to_context() end, { desc = "Go to context" })
map("n", "<leader>rp", function()
  if not _TMUX_PANE_ID then
    local pane_id = vim.fn.input("Enter tmux pane ID: ")
    _TMUX_PANE_ID = pane_id
  end
  local pytest_command = "pytest -s " .. vim.fn.expand("%")
  vim.fn.system("tmux send-keys -t " .. _TMUX_PANE_ID .. " '" .. pytest_command .. "' Enter")
end, { desc = "run pytest on current file in buffer" })

map("n", "<leader>rpu", function()
  if not _TMUX_PANE_ID then
    local pane_id = vim.fn.input("Enter tmux pane ID: ")
    _TMUX_PANE_ID = pane_id
  end
  local pytest_command = "pytest -s " ..
  vim.fn.expand("%") .. " -k " .. require("custom.utils").get_python_function_name()
  vim.fn.system("tmux send-keys -t " .. _TMUX_PANE_ID .. " '" .. pytest_command .. "' Enter")
end, { desc = "run pytest of current test on current file in buffer" })

-- Trouble plugin mappings
map("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle trouble" })
map("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
  { desc = "Workspace diagnostics" })
map("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
  { desc = "Document diagnostics" })
map("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Quickfix list" })
map("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Location list" })
map("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "LSP references" })

-- GP plugin mappings
map("n", "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", { desc = "GpImplement" })
map("v", "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", { desc = "GpImplement" })

-- Insert mode mappings (added from your example)
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- LSP mappings
map("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "LSP declaration" })
map("n", "gd", function() vim.lsp.buf.definition() end, { desc = "LSP definition" })
map("n", "K", function() vim.lsp.buf.hover() end, { desc = "LSP hover" })
map("n", "gi", function() vim.lsp.buf.implementation() end, { desc = "LSP implementation" })
map("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, { desc = "LSP signature help" })
map("n", "<leader>D", function() vim.lsp.buf.type_definition() end, { desc = "LSP definition type" })
map("n", "<leader>ra", function() vim.lsp.buf.rename() end, { desc = "LSP rename" })
map("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "LSP code action" })
map("n", "gr", function() vim.lsp.buf.references() end, { desc = "LSP references" })
map("n", "<leader>lf", function() vim.diagnostic.open_float { border = "rounded" } end, { desc = "Floating diagnostic" })
map("n", "[d", function() vim.diagnostic.goto_prev { float = { border = "rounded" } } end, { desc = "Goto prev" })
map("n", "]d", function() vim.diagnostic.goto_next { float = { border = "rounded" } } end, { desc = "Goto next" })
map("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, { desc = "Add workspace folder" })
map("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, { desc = "Remove workspace folder" })
map("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
  { desc = "List workspace folders" })
map("v", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "LSP code action" })
