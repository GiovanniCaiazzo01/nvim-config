function FixMyEditor()
  -- ── Line Numbers ────────────────────────────────────────────────
  vim.opt.nu = true              -- show absolute line numbers
  vim.opt.relativenumber = true  -- relative numbers for non-current lines (helpful for motions)

  -- ── Tabs & Indentation ───────────────────────────────────────────────
  vim.opt.tabstop = 2            -- visible width of a tab character
  vim.opt.softtabstop = 2        -- spaces inserted/deleted when Tab/Backspace pressed in insert mode
  vim.opt.shiftwidth = 2         -- number of spaces to use for autoindent and >>, <<
  vim.opt.expandtab = true       -- use spaces instead of tab characters when pressing Tab

  -- ── Search ─────────────────────────────────────────────────────────────
  vim.opt.hlsearch = false       -- don't keep search matches highlighted after searching
  vim.opt.incsearch = true       -- show search matches incrementally while typing

  -- ── Colors ──────────────────────────────────────────────────────
  vim.opt.termguicolors = true   -- enable 24-bit RGB colors (required for most color schemes)

  -- ── UI / Scrolling / Signs ─────────────────────────────────────────
  vim.opt.scrolloff = 8          -- maintain 8 lines visible above/below cursor when scrolling
  vim.opt.signcolumn = "yes"     -- always show the sign column (for diagnostics, git, etc.)
  vim.opt.isfname:append("@-@")  -- consider '@' and '-' as part of a filename (fixes path issues)

  -- ── Performance ─────────────────────────────────────────────────────────
  vim.opt.updatetime = 50        -- faster CursorHold and autocommands (lower = more responsive)

  -- ── Visual Guides ─────────────────────────────────────────────────────
  vim.opt.colorcolumn = "120"     -- vertical column at 120 characters to mark style limits

  -- ── Leader Key ────────────────────────────────────────────────────────
  vim.g.mapleader = " "          -- use space as leader key for custom mappings

  -- Additional UI tuning for signcolumn width (commented out)
  -- vim.opt.signcolumn = "yes:9" -- wider sign column for lots of signs (approx 12 characters margin)
  -- For Neovim >= 0.9, you can show only signs without line numbers/folds

end

FixMyEditor()
