local flash = require("flash")

flash.setup({
	opts = {},
	search = {
		mode = "fuzzy",
	},
	label = {
		rainbow = { enabled = true },
	},
	highlight = {
		backdrop = true,
		groups = {
			label = "MiniJump2dSpot",
		},
	},
})
