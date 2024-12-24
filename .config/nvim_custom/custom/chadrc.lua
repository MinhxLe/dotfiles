---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme = "onedark",
	theme_toggle = { "onedark", "one_light" },
	hl_override = highlights.override,
	hl_add = highlights.add,
	statusline = {
		-- modules arg here is the default table of modules
		overriden_modules = function(modules)
			-- filename
			modules[2] = (function()
				-- or just return "" to hide this module
				local icon = "  "
				local fn = vim.fn
				local filename = (fn.expand("%") == "" and "Empty ") or fn.expand("%@")
				if filename ~= "Empty " then
					local devicons_present, devicons = pcall(require, "nvim-web-devicons")

					if devicons_present then
						local ft_icon = devicons.get_icon(filename)
						icon = (ft_icon ~= nil and " " .. ft_icon) or ""
					end

					filename = " " .. filename .. " "
				end
				return "%#St_file_info#" .. icon .. filename .. "%#St_file_sep#"
			end)()
		end,
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
