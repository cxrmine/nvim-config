return {
	"zaldih/themery.nvim",
	lazy = false,
	priority = 1000,
	tag = "v2.0.1",
	keys = {
		{
			"<leader>ct",
			function()
				vim.cmd("Themery")
			end,
			desc = "[c]hange-[t]heme",
		},
	},
	config = function()
		local available_colorschemes = vim.fn.getcompletion("", "color")
		local colorschemes = {}
		local toTitleCase = require("options.utils").toTitleCase
		for _, colorscheme in ipairs(available_colorschemes) do
			local transformed = toTitleCase(colorscheme)
			table.insert(colorschemes, {
				colorscheme = colorscheme,
				name = transformed,
			})
		end
		require("themery").setup({
			livePreview = true,
			themes = colorschemes,
		})
	end,
}
