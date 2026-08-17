return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})
		ts.install({ "lua", "vim", "vimdoc", "cpp", "c", "markdown", "make" })
	end,
}
