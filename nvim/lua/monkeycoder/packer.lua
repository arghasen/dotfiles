-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  }
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end}
  use ("mbbill/undotree")
  use ("tpope/vim-fugitive")
  use ("tpope/vim-dispatch")
  use ("nvim-lualine/lualine.nvim")
  use ("akinsho/bufferline.nvim")
  use ("akinsho/toggleterm.nvim")
  use ("kyazdani42/nvim-tree.lua")
  use ("kyazdani42/nvim-web-devicons")
  use ("numToStr/Comment.nvim")
  use ("github/copilot.vim")
  use {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
        -- Automatically install LSPs to stdpath for neovim
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim'},
        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
    },
  }
  use {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  }
end)
