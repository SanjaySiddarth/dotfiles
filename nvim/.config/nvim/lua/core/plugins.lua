local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer for plugin management
  use 'wbthomason/packer.nvim'

  -- General plugins
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  requires =  { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-tree/nvim-web-devicons'
  use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }
  use {
  'phaazon/mind.nvim',
  branch = 'v2.2',
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    require'mind'.setup()
  end
  }

  -- Themes
  use 'navarasu/onedark.nvim'

  -- Language agnostic plugins
  use 'RRethy/nvim-treesitter-endwise'
  use 'jiangmiao/auto-pairs'
  use 'Yggdroot/indentLine'

  -- Rails specific plugins
  use 'tpope/vim-rails'

  -- LSP plugin and configs
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
