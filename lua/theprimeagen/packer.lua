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
use { "rose-pine/neovim", name = "rose-pine" }
 --colorscheme
 use {'folke/tokyonight.nvim'}
 --text highlighter
 use {'nvim-treesitter/nvim-treesitter', {run='TSUpdate'}}
 use {"sopa0/telescope-makefile"}
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
--Comments
 use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
 }
--webdev
--autoclose tags
use {'windwp/nvim-ts-autotag'}
--auto pair
use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
}
--snippets
use "rafamadriz/friendly-snippets"
--snippet dependency
use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
})
--obsidian.nvim
use({
  "epwalsh/obsidian.nvim",
  tag = "*",  -- recommended, use latest release instead of latest commit
  requires = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "work",
          path = "~/vaults/work",
        },
      },

      -- see below for full list of options 👇
    })
  end,
})

--nerdfont
use({'glepnir/nerdicons.nvim', cmd = 'NerdIcons', config = function() require('nerdicons').setup({}) end})
--lualine status line
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
--colorscheme
use { "ellisonleao/gruvbox.nvim" }
use { "catppuccin/nvim", as = "catppuccin" }
use { "craftzdog/solarized-osaka.nvim" }
--multi line
use { "mg979/vim-visual-multi" }
-- surround bracket shortcut
use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
--jdtls
use 'mfussenegger/nvim-jdtls'
--tmux navigator
use 'christoomey/vim-tmux-navigator'
use 'alexghergh/nvim-tmux-navigation'
--tab lines
-- These optional plugins should be loaded directly because of a bug in Packer lazy loading
use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
use 'romgrk/barbar.nvim'
--snipe.nvim
use "leath-dub/snipe.nvim"
end)

