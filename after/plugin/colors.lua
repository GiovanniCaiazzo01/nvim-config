function ColorMyPencils(color)
	color = color or  "vscode"
    -- vim.cmd("colorscheme vague")

    vim.o.background = "dark"
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "black" }) 
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" }) 

  vim.cmd.colorscheme("vscode")
end

ColorMyPencils()

