local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("challenger-deep-theme/vim")
	use("Mofiqul/dracula.nvim")
	use("catppuccin/nvim")
	use("lunarvim/darkplus.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completion
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline cimpletion
	use("hrsh7th/cmp-nvim-lsp") -- lsp cimpletion
	use("hrsh7th/cmp-nvim-lua") -- completion source for configuration
	use("saadparwaiz1/cmp_luasnip") -- snippet completion

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "p00f/nvim-ts-rainbow" })

	-- Lualine
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Oil
	use("stevearc/oil.nvim")

	--Copilot
	use("zbirenbaum/copilot.lua")
	use({
		"CopilotC-Nvim/CopilotChat.nvim",
		requires = {{
			"zbirenbaum/copilot.lua",
		}, {
			"nvim-lua/plenary.nvim",
		}},
    branch = "main",
		config = function()
			require("CopilotChat").setup({
				show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
				debug = true, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
				disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
				language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
				build = function()
					vim.notify(
						"Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
					)
				end,
			})
		end,
	})

	-- Autopairs
	use("windwp/nvim-autopairs")

	-- Bufferline
	use("akinsho/bufferline.nvim")

	-- Toggle term
	use("akinsho/toggleterm.nvim")

	-- Go-import
	use("mattn/vim-goimports")

	-- Which key
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
