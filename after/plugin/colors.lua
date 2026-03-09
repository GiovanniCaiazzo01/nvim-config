function ColorMyPencils(color)
	color = color or "catppuccin"
  -- vim.cmd("colorscheme vague")

  -- vim.o.background = "dark"
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "black" }) 
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" }) 

  vim.cmd.colorscheme(color)
end

ColorMyPencils()

