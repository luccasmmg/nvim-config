local null_ls_status_ok, null_ls = pcall(require, "none-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.gofmt,
		formatting.prettier,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.phpcsfixer,
	},
})
