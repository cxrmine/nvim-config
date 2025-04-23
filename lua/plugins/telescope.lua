return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		{ "BurntSushi/ripgrep" },
		{ "nvim-lua/plenary.nvim" },
		{ "sharkdp/fd" },
	},
	keys = function(_, keys)
		keys = keys or {}
		local bltin = require("telescope.builtin")
		return vim.tbl_deep_extend("force", keys, {
			{ "<leader>ff", bltin.find_files, desc = "Telescope find files" },
			{ "<leader>fg", bltin.live_grep, desc = "Telescope live grep" },
			{ "<leader>fb", bltin.buffers, desc = "Telescope buffers" },
			{ "<leader>fh", bltin.help_tags, desc = "Telescope help tags" },
		})
	end,
}
