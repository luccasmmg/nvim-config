local none_ls_status_ok, none_ls = pcall(require, "none-ls")
if not none_ls_status_ok then
	return
end

-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/none-ls/builtins/formatting
local formatting = none_ls.builtins.formatting
-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/none-ls/builtins/diagnostics
local diagnostics = none_ls.builtins.diagnostics

none_ls.setup({
	debug = false,
	sources = {
		formatting.gofmt,
		formatting.prettier,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.phpcsfixer,
	},
})
