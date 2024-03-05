--[p This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --projectfinder
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
 --colorscheme
  use {'folke/tokyonight.nvim'}
 --text highlighter
 use {'nvim-treesitter/nvim-treesitter', {run='TSUpdate'}}
 --colorscheme
 use {'rebelot/kanagawa.nvim'}
 --plugin window viewer
 use{'nvim-treesitter/playground'}
 use{'theprimeagen/harpoon'}
 --undotree plugin
 use{'mbbill/undotree'}
 --git plugin
 use{'tpope/vim-fugitive'}
 use{'williamboman/mason.nvim'}

 use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}
--Comment PLugin
 use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
 }
--colorscheme
use { "ellisonleao/gruvbox.nvim" }

end)
