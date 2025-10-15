
require("zen-mode").setup({
  window = {
    backdrop = 0.95,
    width = 200,
    height = 0.8,
    options = {
      signcolumn = "no",
      cursorline = false,
      cursorcolumn = false,
      foldcolumn = "0",
    },
  },
})

-- Keymaps
vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<cr>", { desc = "Toggle Zen Mode" })
