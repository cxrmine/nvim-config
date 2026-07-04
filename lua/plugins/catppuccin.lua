return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 4000,
	---@module "catppuccin"
	---@type CatppuccinOptions
	opts = {
		flavour = "auto",
		no_bold = true,
		float = {
			solid = false,
			transparent = true,
		},
		---@type CtpIntegrations
		integrations = {
			noice = true,
			gitsigns = true,
			treesitter = true,
			notify = true,
			blink_cmp = {
				style = "bordered",
			},
			treesitter_context = true,
			telescope = {
				enabled = true,
			},
			which_key = true,
		},
		term_colors = true,
		transparent_background = true,
		auto_integrations = true,
		---@type CtpStyles
		styles = {
			comments = { "bold" },
			miscs = { "bold" },
			conditionals = { "bold" },
		},
	},
}
