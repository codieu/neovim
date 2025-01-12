local M = { 
	"rose-pine/neovim", 
	name = "rose-pine",

	config = function()
		vim.cmd("colorscheme rose-pine")
	end,

  opts = {
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "moon", -- main, moon, or dawn
    dim_inactive_windows = true,
  }
}

return M
