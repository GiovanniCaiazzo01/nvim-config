function FixMyEditor()
-- ── Numeri di riga ─────────────────────────────────────────────────────────────
vim.opt.nu = true              -- mostra i numeri assoluti
vim.opt.relativenumber = true  -- righe diverse dalla corrente con numero relativo
-- (risultato: riga corrente = numero reale; le altre = distanza: 1,2,3… utile per movimenti)

-- ── Tab & Indentazione ────────────────────────────────────────────────────────
vim.opt.tabstop = 2            -- larghezza VISIVA di un carattere TAB (\t)
vim.opt.softtabstop = 2        -- quanto inseriscono/cancellano Tab/Backspace in Insert mode
vim.opt.shiftwidth = 2        -- di quanto rientrano >>, << e l'autoindent
vim.opt.expandtab = true       -- quando premi Tab, inserisce SPAZI (non \t)

-- ── Ricerca ───────────────────────────────────────────────────────────────────
vim.opt.hlsearch = false       -- non lascia evidenziati i match dopo la ricerca
vim.opt.incsearch = true       -- mostra i match mentre digiti (ricerca incrementale)

-- ── Colori ────────────────────────────────────────────────────────────────────
vim.opt.termguicolors = true   -- abilita i colori 24-bit (necessario per molti temi)

-- ── UI / Scrolling / Segni ────────────────────────────────────────────────────
vim.opt.scrolloff = 8          -- tiene almeno 8 righe di margine sopra/sotto al cursore
vim.opt.signcolumn = "yes"     -- colonna dei segni (diagnostiche, git, ecc.) sempre visibile
vim.opt.isfname:append("@-@")  -- considera '@' e '-' come parte di un nome file (meno problemi nei path)

-- ── Performance ───────────────────────────────────────────────────────────────
vim.opt.updatetime = 50        -- ms per CursorHold/autocmd: più basso = più reattivo (ma un filo più CPU)

-- ── Guide visive ──────────────────────────────────────────────────────────────
vim.opt.colorcolumn = "120"     -- guida verticale alla colonna 80 (limite stile/testo)

-- ── Leader key ────────────────────────────────────────────────────────────────
vim.g.mapleader = " "          -- imposta lo Space come leader (per le tue <leader> mappings)


-- ──────────────────────────────────────────────────────────────────────────────
-- ZOOM & “DISTACCO DA SINISTRA”
-- ──────────────────────────────────────────────────────────────────────────────
vim.opt.signcolumn = "yes:9"          -- 6 colonne di segni ≈ 12 caratteri di margine
-- Se hai Neovim >= 0.9 puoi mostrare solo i segni (niente numeri/fold):
end

FixMyEditor()
