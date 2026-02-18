return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",

	---@type bufferline.UserConfig
	opts = {
		options = {
			modified_icon = "󰄛",
			separator_style = "slant",
		},
	},
	config = function(_, opts)
		opts = opts or {}
		local bufferline = require("bufferline")
		local highlights = require("catppuccin.special.bufferline").get_theme()

		bufferline.setup({
			highlights = highlights,
		})
	end,
}
