require("nvim-treesitter.configs").setup {
  -- List of parser names, or "all" (the listed parsers must always be installed)
  ensure_installed = {
  "c",
  "lua",
  "luadoc",
  "vim",
  "vimdoc",
  "glimmer_javascript",
  "typescript",
  "query",
  "markdown",
  "markdown_inline",
  "go"
},
  -- Parsers are installed asynchronously by default, to avoid blocking
  sync_install = false,
  -- Enable auto-installation for missing parsers when opening buffers
  -- Recommended: set to false if you haven't installed the `tree-sitter` CLI
  auto_install = true,
  highlight = {
    enable = true, -- Enable syntax highlighting via Treesitter
    -- Additional regex-based highlighting (may cause performance issues)
    additional_vim_regex_highlighting = false,
    -- Disable Treesitter highlighting in help buffers for performance
    disable = "help"
  },
}
