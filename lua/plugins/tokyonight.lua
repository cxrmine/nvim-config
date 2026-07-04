return {
	"folke/tokyonight.nvim",
	priority = 4000,
	lazy = false,

	---@module "tokyonight"
	---@type tokyonight.Config
	opts = {
		cache = true,
		transparent = false,
		style = "moon",
		light_style = "day",
		styles = {
			comments = { italic = true },
			types = { italic = true },
			floats = "transparent",
		},
		plugins = {
			bufferline = true,
			lualine = true,
			telescope = true,
			cmp = true,
			lazy = true,
			treesitter = true,
		},
	},
}
