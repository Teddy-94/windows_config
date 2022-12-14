return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    --use {'catppuccin/nvim', as = 'catppuccin'}
    use {'folke/tokyonight.nvim', as = 'tokyonight'}

    -- use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    --LSP autocomplete
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
use 'neovim/nvim-lspconfig'
use 'williamboman/nvim-lsp-installer'

--File browsing
use 'nvim-telescope/telescope-file-browser.nvim'
--Telescope Requirements
use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'

use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
end)