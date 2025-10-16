function ColorMyPencils(color)
	color = color or  "rose-pine"
    -- vim.cmd("colorscheme vague")

	vim.api.nvim_set_hl(0, "Normal", { bg = "black" }) 
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" }) 

end

ColorMyPencils()

