local lsp_zero = require('lsp-zero')

-- Setup Mason (LSP manager)
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',         -- TypeScript/JavaScript LSP
    'eslint',        -- ESLint diagnostics
    'tailwindcss',   -- Tailwind CSS LSP
    'html',          -- HTML LSP
    'cssls',         -- CSS LSP
    'jsonls',        -- JSON LSP
    'emmet_ls',      -- Emmet LSP
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    -- Typescript custom options (inlay hints, etc.)
    tsserver = function()
      require('lspconfig').tsserver.setup({
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayFunctionParameterTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })
    end,

    -- ESLint custom working directory
    eslint = function()
      require('lspconfig').eslint.setup({
        settings = {
          workingDirectory = { mode = "location" },
        },
      })
    end,
  }
})

-- Extend LSP config for nvim-cmp
lsp_zero.extend_lspconfig()

-- Keymaps when LSP attaches to buffer
lsp_zero.on_attach(function(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, {buffer = bufnr, desc = desc})
  end

  map('n', 'gd',        vim.lsp.buf.definition,        'Go to definition')
  map('n', 'gD',        vim.lsp.buf.declaration,       'Go to declaration')
  map('n', 'gr',        vim.lsp.buf.references,        'References')
  map('n', 'gi',        vim.lsp.buf.implementation,    'Go to implementation')
  map('n', 'K',         vim.lsp.buf.hover,             'Hover')
  map('n', '<leader>rn',vim.lsp.buf.rename,            'Rename symbol')
  map('n', '<leader>ca',vim.lsp.buf.code_action,       'Code action')
  map('n', '[d',        vim.diagnostic.goto_prev,      'Prev diagnostic')
  map('n', ']d',        vim.diagnostic.goto_next,      'Next diagnostic')
  map('n', '<leader>e', vim.diagnostic.open_float,     'Line diagnostics')
  map('n', '<leader>f', function() vim.lsp.buf.format({async=false}) end, 'Format')

  -- Inlay hints for Neovim 0.11+
  if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
    pcall(vim.lsp.inlay_hint.enable, true, {bufnr = bufnr})
  elseif type(vim.lsp.inlay_hint) == 'function' then
    pcall(vim.lsp.inlay_hint, bufnr, true)
  end
end)

-- nvim-cmp (completion engine)
local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>']     = cmp.mapping.confirm({ select = true }),
    ['<C-Space>']= cmp.mapping.complete(),
    ['<Tab>']    = function(fallback)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      else fallback() end
    end,
    ['<S-Tab>']  = function(fallback)
      if cmp.visible() then cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then luasnip.jump(-1)
      else fallback() end
    end,
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
  completion = { completeopt = 'menu,menuone,noinsert' },
})

-- Autopairs integration
local ok_pairs, cmp_autopairs = pcall(function()
  return require('nvim-autopairs.completion.cmp')
end)
if ok_pairs then
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

-- Diagnostic display options
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
