-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }


-- use ('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
-- use ('nvim-treesitter/playground')
--use ('theprimeagen/harpoon')
 use ('mbbill/undotree')


 use {
	 'VonHeikemen/lsp-zero.nvim',
	 branch = 'v3.x',
	 requires = {
		 {'neovim/nvim-lspconfig'},             -- Required
		 {'williamboman/mason.nvim'},           -- Optional
		 {'williamboman/mason-lspconfig.nvim'}, -- Optional
		 -- Autocompletion
		 {'hrsh7th/nvim-cmp'},     -- Required
		 {'hrsh7th/cmp-nvim-lsp'}, -- Required
		 {'L3MON4D3/LuaSnip'},     -- Required
--end of lsp-zero

		 {'hrsh7th/cmp-buffer'},
		 {'hrsh7th/cmp-path'},
		 {'saadparwaiz1/cmp_luasnip'},
		 {'hrsh7th/cmp-nvim-lua'},
		 -- Snippets
		 {'L3MON4D3/LuaSnip'},
		 {'rafamadriz/friendly-snippets'},


	 }
 }

  end)

