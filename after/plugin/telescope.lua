local builtin = require("telescope.builtin")

-- Search for project files:
-- Try git-tracked files first, fall back to all files if not in git repo
vim.keymap.set("n", "<leader>ff", function()
  local ok = pcall(builtin.git_files, { show_untracked = true })
  if not ok then
    builtin.find_files()
  end
end, { desc = "Project files (git or all)" })

-- Live grep project files including hidden, excluding .git and .env folders
vim.keymap.set("n", "<leader>ps", function()
  builtin.live_grep({
    additional_args = function()
      return { "--hidden", "--glob", "!.git/*", "--glob", "!.env/*" }
    end
  })
end, { desc = "Project live grep (hidden files except .git, .env)" })
