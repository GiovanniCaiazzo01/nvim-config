-- This file can be loaded by calling:
--    lua require('plugins')
-- from your init.vim (or require it from init.lua).
-- It defines and installs plugins using packer.nvim.

-- Start Packer and declare plugins.
-- The `use` function accepts either a string (repo path) or a table with options.
return require('packer').startup(function(use)
  -- Let Packer manage itself (so it can update itself like any other plugin).
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder: Telescope (pinning to tag 0.1.8 for stability).
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- BUFFERLINE (AGGIUNGI QUESTO BLOCCO COMPLETO)
  use 'nvim-tree/nvim-web-devicons' 

  -- Colorscheme vague.nvim
  use 'Mofiqul/vscode.nvim'

  -- Treesitter for better syntax highlighting, indentation, and code parsing.
  use(
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  )

  -- Plenary again (utility functions used by many plugins).
  use('nvim-lua/plenary.nvim')

  -- Harpoon: quick file marking and rapid navigation between files.
  use('ThePrimeagen/harpoon')

  -- Undotree: visual, navigable undo history.
  use('mbbill/undotree')

  -- Fugitive: powerful Git integration (:Git, :Gdiffsplit, etc.).
  use('tpope/vim-fugitive')

  -- LSP-zero v4 and its dependencies:
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    requires = {
      -- Core LSP support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },

      -- Autopairs: auto-close brackets/quotes, integrates with completion
      { 'windwp/nvim-autopairs' },
    }
  }

end)

