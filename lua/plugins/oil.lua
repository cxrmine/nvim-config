return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opts = {} },
	},
	cmd = { "OIL" },
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "opens current file tree in a new vim buffer" },
	},
	opts = {
		columns = {
			"size",
			"icon",
		},
	},
}
