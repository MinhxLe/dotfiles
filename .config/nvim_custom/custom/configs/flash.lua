local flash = require("flash")


flash.setup({
  opts = {},
  search = {
    mode = "fuzzy"
  },
  highlight = {
    groups = {
      label = "MiniJump2dSpot"
    }
  }
})
