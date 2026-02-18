return {
	"Diogo-ss/42-header.nvim",
	event = "BufEnter",
	keys = {
		{
			"<leader>ft",
			function()
				vim.cmd("Stdheader")
			end,
			desc = "[f]orty-[t]wo | adds 42 header on C files",
		},
		{
			"<F2>",
			function()
				vim.cmd("Stdheader")
			end,
			desc = "Adds the 42 header",
		},
	},
	opts = {
		default_map = false,
		auto_update = false,
		user = "tmalkawi",
		mail = "marvin@42.fr",
	},
}
