-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
		{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins

		-- Colorschemes
		-- { "lunarvim/colorschemes" }, -- A bunch of colorschemes you can try out
		{ "challenger-deep-theme/vim" },
		{ "Mofiqul/dracula.nvim" },
		{ "catppuccin/nvim" },
		{ "lunarvim/darkplus.nvim" },

		-- cmp plugins
		{ "hrsh7th/nvim-cmp" }, -- The completion plugin
		{ "hrsh7th/cmp-buffer" }, -- buffer completion
		{ "hrsh7th/cmp-path" }, -- path completions
		{ "hrsh7th/cmp-cmdline" }, -- cmdline completion
		{ "hrsh7th/cmp-nvim-lsp" }, -- lsp completion
		{ "hrsh7th/cmp-nvim-lua" }, -- completion source for configuration
		{ "saadparwaiz1/cmp_luasnip" }, -- snippet completion

		-- snippets
		{ "L3MON4D3/LuaSnip" }, -- snippet engine
		{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

		-- LSP
		{ "neovim/nvim-lspconfig" }, -- enable LSP
		{ "williamboman/mason.nvim" }, -- simple to use language server installer
		{ "williamboman/mason-lspconfig.nvim", tag = "v1.32.0" }, -- simple to use language server installer
		{ "jose-elias-alvarez/null-ls.nvim" }, -- LSP diagnostics and code actions

		-- Telescope
		{ "nvim-telescope/telescope.nvim" },
		{ "nvim-telescope/telescope-media-files.nvim" },

		-- Treesitter
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
		{ "p00f/nvim-ts-rainbow" },

		-- Lualine
		{ "kyazdani42/nvim-web-devicons" },
		{
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		},

		-- Oil
		{ "stevearc/oil.nvim" },

		-- Supermaven
		{
			"supermaven-inc/supermaven-nvim",
			config = function()
				require("supermaven-nvim").setup({
					keymaps = {
						accept_suggestion = "<C-l>",
					},
				})
			end,
		},
		{
			"yetone/avante.nvim",
			event = "VeryLazy",
			lazy = false,
			version = false, -- set this if you want to always pull the latest change
			opts = {
				-- add any opts here
			},
			-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
			build = "make",
			-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
			dependencies = {
				"stevearc/dressing.nvim",
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				--- The below dependencies are optional,
				"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
				"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
				{
					-- support for image pasting
					"HakonHarnes/img-clip.nvim",
					event = "VeryLazy",
					opts = {
						-- recommended settings
						default = {
							embed_image_as_base64 = false,
							prompt_for_file_name = false,
							drag_and_drop = {
								insert_mode = true,
							},
							-- required for Windows users
							use_absolute_path = true,
						},
					},
				},
				{
					-- Make sure to set this up properly if you have lazy=true
					"MeanderingProgrammer/render-markdown.nvim",
					opts = {
						file_types = { "markdown", "Avante" },
					},
					ft = { "markdown", "Avante" },
				},
			},
		},

		-- Autopairs
		{ "windwp/nvim-autopairs" },

		-- Bufferline
		{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

		-- Toggle term
		{ "akinsho/toggleterm.nvim" },

		-- Go-import
		{ "mattn/vim-goimports" },

		-- Tmux navigator
		{
			"christoomey/vim-tmux-navigator",
			cmd = {
				"TmuxNavigateLeft",
				"TmuxNavigateDown",
				"TmuxNavigateUp",
				"TmuxNavigateRight",
				"TmuxNavigatePrevious",
				"TmuxNavigatorProcessList",
			},
			keys = {
				{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
				{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
				{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
				{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
				{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
			},
		},
		-- Which key
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
			keys = {
				{
					"<leader>?",
					function()
						require("which-key").show({ global = false })
					end,
					desc = "Buffer Local Keymaps (which-key)",
				},
			},
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
