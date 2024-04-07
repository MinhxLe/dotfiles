local flash = require("flash")

flash.setup({
	opts = {},
	search = {
		mode = "fuzzy",
	},
	highlight = {
		{ backdrop = false },
		groups = {
			label = "MiniJump2dSpot",
		},
	},
})
