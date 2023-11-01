function ColorMyPencils(color)
	color = color or "gruvbox-material"
	-- vim.g.oh_lucy_transparent_background = true
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" })
end

ColorMyPencils()
