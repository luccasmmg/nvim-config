local opts = { noremap = true, silent = true }
local wk = require("which-key")

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Disable ctrl-M
keymap("n", "<C-m>", "<Nop>", opts)

keymap("n", "<leader>e", "<cmd>Oil<CR>", opts)
vim.keymap.set("n", "<leader>e", function()
	vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil")
end)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Quickfix --
keymap("n", "<A-n>", ":cnext<CR>", opts)
keymap("n", "<A-p>", ":cprevious<CR>", opts)

keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<c-f>", "<cmd>Telescope live_grep<cr>", opts)

-- Create an autocommand for quickfix windows
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		-- Map the Enter key to <CR> in normal mode for the quickfix buffer.
		-- This effectively restores the default behavior.
		vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CR>", {
			noremap = true,
			silent = true,
		})
	end,
})

-- Buffers --

vim.api.nvim_set_keymap(
	"n",
	"<leader>bc",
	":%bd|e#|bd#<CR>",
	{ noremap = true, silent = true, desc = "Close all buffers except current" }
)
