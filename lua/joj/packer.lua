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
  -- It depends on plenary.nvim (utility library), declared in `requires`.
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Colorscheme: rose-pine.
  -- `as = 'rose-pine'` sets an alias so you can refer to it by that name.
  -- The `config` function runs after the plugin loads and sets the colorscheme.
  -- use "olimorris/onedarkpro.nvim"

   -- Colorscheme vague.nvim
  -- use {
  --   'vague-theme/vague.nvim',
  --   -- caricalo subito se è il tema principale
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('vague').setup()
  --     vim.cmd('colorscheme vague')
  --   end,
  -- }

  -- somewhere in your config:

  -- Treesitter for better syntax highlighting, indentation, and code parsing.
  -- The `run = ':TSUpdate'` step ensures parsers are kept up to date after install/update.
  --
  -- NOTE: The usual Packer style is a single table, like:
  --   use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  -- Your two-argument form often still works, but the table form is recommended.
  use(
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  )

  -- Plenary again (utility functions used by many plugins).
  -- You already require it for Telescope; declaring it explicitly is harmless
  -- and can be useful if you use Plenary directly in your config.
  use('nvim-lua/plenary.nvim')

  -- Harpoon: quick file marking and rapid navigation between files.
  use('ThePrimeagen/harpoon')

  -- Undotree: visual, navigable undo history.
  use('mbbill/undotree')

  -- Fugitive: powerful Git integration (:Git, :Gdiffsplit, etc.).
  use('tpope/vim-fugitive')

  -- LSP-zero v4 and its dependencies:
  -- A convenience layer to quickly set up LSP, completion, snippets, and autopairs.
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    requires = {
      -- Core LSP support
      { 'neovim/nvim-lspconfig' },          -- Configure built-in LSP client
      { 'williamboman/mason.nvim' },        -- Installer/manager for LSP/DAP/formatters
      { 'williamboman/mason-lspconfig.nvim' }, -- Bridge Mason <-> lspconfig

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },       -- Completion engine
      { 'hrsh7th/cmp-nvim-lsp' },   -- LSP completion source
      { 'hrsh7th/cmp-path' },       -- Path completion
      { 'hrsh7th/cmp-buffer' },     -- Buffer words completion

      -- Snippets
      { 'L3MON4D3/LuaSnip' },       -- Snippet engine
      { 'saadparwaiz1/cmp_luasnip' }, -- LuaSnip source for nvim-cmp
      { 'rafamadriz/friendly-snippets' }, -- A big collection of ready-made snippets

      -- Autopairs: auto-close brackets/quotes, integrates with completion
      { 'windwp/nvim-autopairs' },
    }
  }

end)

