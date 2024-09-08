local gp = require("gp")
gp.setup({
  openai_api_key = {
    "cat", "/Users/minh/.secrets_folder/OPENAI_KEY"
  },
  providers = {
    anthropic = {
      endpoint = "https://api.anthropic.com/v1/messages",
      secret = os.getenv("ANTHROPIC_API_KEY"),
    },
  },
  agents = {
    -- {
    --   name = "ChatGPT4o",
    --   chat = true,
    --   command = true,
    --   -- string with model name or table with model name and parameters
    --   model = { model = "gpt-4o" },
    --   -- system prompt (use this to specify the persona/role of the AI)
    --   system_prompt = "You are a general AI assistant.\n\n"
    --       .. "The user provided the additional info about how they would like you to respond:\n\n"
    --       .. "- If you're unsure don't guess and say you don't know instead.\n"
    --       .. "- Ask question if you need clarification to provide better answer.\n"
    --       .. "- Think deeply and carefully from first principles step by step.\n"
    --       .. "- Zoom out first to see the big picture and then zoom in to details.\n"
    --       .. "- Use Socratic method to improve your thinking and coding skills.\n"
    --       .. "- Don't elide any code from your output if the answer requires coding.\n"
    --       .. "- Take a deep breath; You've got this!\n",
    -- },
    {
			provider = "anthropic",
			name = "ChatClaude-3-5-Sonnet",
			chat = true,
			command = false,
			-- string with model name or table with model name and parameters
			model = { model = "claude-3-5-sonnet-20240620", temperature = 0.8, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
		},
		{
			provider = "anthropic",
			name = "ChatClaude-3-Haiku",
			chat = true,
			command = false,
			-- string with model name or table with model name and parameters
			model = { model = "claude-3-haiku-20240307", temperature = 0.8, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
		},
    {
			provider = "anthropic",
			name = "CodeClaude-3-Haiku",
			chat = false,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "claude-3-haiku-20240307", temperature = 0.8, top_p = 1 },
			system_prompt = require("gp.defaults").code_system_prompt,
		},
  }
})
