return {
	"~/repos/FTnorm.nvim/",
	name = "FTnorm.nvim",
	dev = true,
	opts = {
		enabled = true,
	},
	config = function(_, opts)
		opts = opts or {}
		require("FTnorm").setup(opts)
	end,
}
