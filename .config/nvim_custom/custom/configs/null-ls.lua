local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.diagnostics.flake8,
  b.formatting.yapf,
  -- b.formatting.isort,
  b.formatting.autoflake,

  -- b.diagnostics.mypy,

  -- terraform
  b.diagnostics.terraform_validate
}

null_ls.setup {
  debug = true,
  sources = sources,
}
