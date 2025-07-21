require "nvchad.mappings"

-- add your mappings here
local map = vim.keymap.set

-- General mappings
map("n", ";", ":", { desc = "enter command mode", nowait = true })
map("n", "fn", ":let @+ = expand('%')<cr>", { desc = "Copy file path" })
map("n", "cn", ":cn<cr>", { desc = ":cn" })
map("n", "cN", ":cN<cr>", { desc = ":cN" })

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

-- Treesitter context mappings
map("n", "[c", function() require("treesitter-context").go_to_context() end, { desc = "Go to context" })

-- Trouble plugin mappings
map("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "LSP references" })
map("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle trouble" })
map("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
  { desc = "Workspace diagnostics" })
map("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
  { desc = "Document diagnostics" })
map("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Quickfix list" })
map("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Location list" })

-- GP plugin mappings
map("n", "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", { desc = "GpImplement" })
map("v", "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", { desc = "GpImplement" })

-- Insert mode mappings (added from your example)
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- LSP mappings
map("n", "fm", function() vim.lsp.buf.format({ async = true }) end, { desc = "LSP formatting" })
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
map("n", "<leader>q", function() vim.diagnostic.setqflist() end, { desc = "diagnostic setloclist" })

-- Tmux integration mappings
_TMUX_PANE_ID = _TMUX_PANE_ID or nil
local function get_or_set_tmux_pane_id()
  if not _TMUX_PANE_ID then
    local pane_id = vim.fn.input("Enter tmux pane ID: ")
    _TMUX_PANE_ID = pane_id
  end
  return _TMUX_PANE_ID
end

-- Function to send text to tmux pane
local function send_to_tmux(text)
  local pane_id = get_or_set_tmux_pane_id()
  vim.fn.system("tmux send-keys -t " .. pane_id .. " '" .. text .. "' Enter")
end

map("n", "<leader>rr", function()
  get_or_set_tmux_pane_id()
  vim.fn.system("tmux send-keys -t " .. _TMUX_PANE_ID .. " C-p Enter")
end, { desc = "Run last command in tmux pane" })

-- Python development mappings
map("n", "<leader>pb", "iimport ipdb;ipdb.set_trace()  # noqa<Esc>", { desc = "Insert Python debugger" })

-- Map to run current file in IPython
vim.keymap.set("n", "<leader>rp", function()
  local file_path = vim.fn.expand("%")
  local run_command = "%run " .. file_path
  send_to_tmux(run_command)
end, { desc = "run current file in IPython" })

-- run current method
vim.keymap.set("n", "<leader>rm", function()
  -- Get the current line after the jump (before cursor position is restored)
  local line_num = vim.fn.line('.')
  local line = vim.fn.getline(line_num)
  -- Extract function name
  local function_name = line:match("^%s*def%s+([%w_]+)")
  if function_name then
    send_to_tmux(function_name .. "()")
  else
    print("No function found")
  end
end, { desc = "run current python function" })

-- Function to fold around outermost function using treesitter
local function fold_outermost_function()
  local ts = vim.treesitter
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row, col = cursor[1] - 1, cursor[2] -- Convert to 0-indexed
  
  -- Get the current buffer and its parser
  local bufnr = vim.api.nvim_get_current_buf()
  local parser = ts.get_parser(bufnr)
  if not parser then
    vim.notify("No treesitter parser found for this buffer", vim.log.levels.WARN)
    return
  end
  
  local tree = parser:parse()[1]
  local root = tree:root()
  
  -- Find all function nodes that contain the cursor
  local function_nodes = {}
  
  local function find_functions(node)
    if node:type() == "function_definition" or node:type() == "async_function_definition" then
      local start_row, start_col, end_row, end_col = node:range()
      -- Check if cursor is within this function
      if start_row <= row and row <= end_row and 
         (start_row < row or start_col <= col) and 
         (row < end_row or col <= end_col) then
        table.insert(function_nodes, {
          node = node,
          start_row = start_row,
          end_row = end_row,
          depth = #function_nodes -- Track nesting depth
        })
      end
    end
    
    for child in node:iter_children() do
      find_functions(child)
    end
  end
  
  find_functions(root)
  
  if #function_nodes == 0 then
    vim.notify("No function found at cursor position", vim.log.levels.WARN)
    return
  end
  
  -- Find the outermost function (first one in the list since we traverse top-down)
  local outermost = function_nodes[1]
  
  -- Create the fold
  local start_line = outermost.start_row + 1 -- Convert to 1-indexed
  local end_line = outermost.end_row + 1
  
  -- Set fold method to manual if not already
  vim.wo.foldmethod = "manual"
  
  -- Create the fold
  vim.cmd(string.format("%d,%dfold", start_line, end_line))
  
  vim.notify(string.format("Folded outermost function (lines %d-%d)", start_line, end_line))
end

-- Map the function to a key
map("n", "<leader>zf", fold_outermost_function, { desc = "Fold outermost function" })
