require("user.options")
require("user.plugins")
require("user.keymaps")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.treesitter")
require("user.telescope")
require("user.lualine")
require("user.autopairs")
require("user.bufferline")
require("oil").setup({})
require("user.toggleterm")
vim.cmd([[
hi BufferLineFill guibg='#1e1c31'
]])
-- require 'nvim-tree'.setup {}
