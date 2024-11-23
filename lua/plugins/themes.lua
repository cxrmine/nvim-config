return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		opts = {
			livePreview = true,
			themes = {
				"kanagawa-lotus",
				"kanagawa-dragon",
				"kanagawa-wave",
				"tokyonight-day",
				"tokyonight-moon",
				"tokyonight-storm",
				"catppuccin-latte",
				"catppuccin-frappe",
				"catppuccin-macchiato",
				"catppuccin-mocha",
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"rebelot/kanagawa.nvim",
		name = "Katsushika Hokusai",
		config = function()
			local kanagawa = require("kanagawa")
			kanagawa.setup({
				commentStyle = {
					italic = true,
					bold = true,
				},
				typeStyle = {
					italic = true,
				},
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			styles = {
				keywords = { "bold", "italic" },
			},
		},
	},
}
