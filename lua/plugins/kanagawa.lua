return {
	"rebelot/kanagawa.nvim",
	name = "Katsushika Hokusai",
	priority = 4000,
	config = function()
		local kanagawa = require("kanagawa")
		kanagawa.setup {
			commentStyle = {
				bold = true,
				italic = true,
			},
			functionStyle = {
				bold = true,
				italic = false,
			},
			typeStyle = {
				bold = true,
				italic = true,
			},
		}
	end,
}
