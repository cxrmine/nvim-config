return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			local tree = require("nvim-tree")
			tree.setup()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
}
