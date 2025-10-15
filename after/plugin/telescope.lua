local builtin = require("telescope.builtin")

-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>ff", function()
	-- prova git_files; se non sei in una repo, fai fallback a eind_files
	local ok = pcall(builtin.git_files, { show_untracked = true })
	if not ok then builtin.find_files() end
end, { desc = "Project files" })
-- vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git files" })


vim.keymap.set("n", "<leader>ps", function()
  builtin.live_grep({
    additional_args = function() return { "--hidden", "--glob", "!.git/*" } end,
  })
end, { desc = "Project search (live)" })


-- vim.keymap.set("n", "<leader>ps", function()
-- 	builtin.live_grep({ search = vim.fn.input("grep > ") })
-- end)
