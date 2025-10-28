-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
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
    { "nvim-lua/popup.nvim" },   -- An implementation of the Popup API from vim in Neovim
    { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins

    -- Colorschemes
    -- { "lunarvim/colorschemes" }, -- A bunch of colorschemes you can try out
    { "challenger-deep-theme/vim" },
    { "Mofiqul/dracula.nvim" },
    { "catppuccin/nvim" },
    { "lunarvim/darkplus.nvim" },

    -- cmp plugins
    { "hrsh7th/nvim-cmp" },                                                                              -- The completion plugin
    { "hrsh7th/cmp-buffer" },                                                                            -- buffer completion
    { "hrsh7th/cmp-path" },                                                                              -- path completions
    { "hrsh7th/cmp-cmdline" },                                                                           -- cmdline completion
    { "hrsh7th/cmp-nvim-lsp",                     commit = "a8912b88ce488f411177fc8aed358b04dc246d7b" }, -- lsp completion
    { "hrsh7th/cmp-nvim-lua" },                                                                          -- completion source for configuration
    { "saadparwaiz1/cmp_luasnip" },                                                                      -- snippet completion

    -- snippets
    { "L3MON4D3/LuaSnip" },             -- snippet engine
    { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

    -- LSP
    { "neovim/nvim-lspconfig" },             -- enable LSP
    { "williamboman/mason.nvim" },           -- simple to use language server installer
    { "williamboman/mason-lspconfig.nvim" }, -- simple to use language server installer
    { "nvimtools/none-ls.nvim" },            -- LSP diagnostics and code actions

    -- Telescope
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-media-files.nvim" },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
    { "HiPhish/nvim-ts-rainbow2" },

    -- Lualine
    { "nvim-tree/nvim-web-devicons" },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Diffview
    { "sindrets/diffview.nvim" },

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
        { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
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
