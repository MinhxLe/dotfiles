local options = {
  vendors = {
    deepseek = {
      __inherited_from = "openai",
      api_key_name = "DEEPSEEK_API_KEY",
      endpoint = "https://api.deepseek.com",
      model = "deepseek-chat",
    },
  },
  provider = "deepseek",
}
local avante = require("avante")
avante.setup(options)
