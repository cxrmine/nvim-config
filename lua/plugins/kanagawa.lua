return {
	"rebelot/kanagawa.nvim",
	name = "Katsushika Hokusai",
	priority = 4000,
	config = function()
		local kanagawa = require("kanagawa")
		kanagawa.setup({
			commentStyle = { italic = false },
			keywordStyle = { italic = false },
			statementStyle = { bold = false },
		})
	end,
}
