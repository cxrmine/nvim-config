return {
	{
		"mistricky/codesnap.nvim",
		build = "make",
		keys = {
			{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
			{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
		},
		opts = {
			save_path = "~/Pictures",
			has_breadcrumbs = true,
			bg_theme = "bamboo",
		},
	},
	{
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
				function ()
					vim.cmd("Stdheader")
				end,
				desc = "Adds the 42 header"
			}
		},
		opts = {
			auto_update = false,
			default_map = false,
			auto_update = false,
			user = "tmalkawi",
			mail = "marvin@42.fr",
		},
	},
	{
		"andweeb/presence.nvim",
		opts = {
			neovim_image_text = "nvim for the boys",
		},
	},
}
