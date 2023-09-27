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
    "ellisonleao/gruvbox.nvim"
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects'
    },
     run = ':TSUpdate'
  }
  use { 'nvim-treesitter/nvim-treesitter-context' }

  use {
    "mbbill/undotree"
  }

  use {
    "tpope/vim-fugitive"
  }

  use {
    "tpope/vim-rhubarb"
  }

  use {
    "tpope/vim-sleuth"
  }

  use {
    "neovim/nvim-lsp"
  }

  use { 'ryanoasis/vim-devicons' }
  use ( 'junegunn/fzf', { run = 'fzf#install()' } )
  use { 'junegunn/fzf.vim' }
  use { 'preservim/nerdcommenter' }
  use { 'xolox/vim-misc' }
  use { 'xolox/vim-session' }
  use { 'itchyny/lightline.vim' }
  use { 'rhysd/clever-f.vim' }
  use { 'preservim/nerdtree' }
  use { 'tpope/vim-git' }
  use { 'vim-syntastic/syntastic' }
  use { 'airblade/vim-gitgutter' }
  use { 'vim-airline/vim-airline' }
  use { 'majutsushi/tagbar' }
  use { 'vim-airline/vim-airline-themes' }
  use { 'chriskempson/base16-vim' }
  use { 'arcticicestudio/nord-vim' }
  use { 'honza/vim-snippets' }
  use { 'ctrlpvim/ctrlp.vim' }
  use { 'lervag/vimtex' }
  use { 'norcalli/nvim-colorizer.lua' }
  use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
            pcall(vim.cmd, 'MasonUpdate')
          end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional
        { 'williamboman/nvim-lsp-installer' },

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }
  use { 'folke/zen-mode.nvim' }
  use { 'folke/twilight.nvim' }


use {
  "folke/todo-comments.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}
use { 'numToStr/Comment.nvim', opts = {} }


end)
