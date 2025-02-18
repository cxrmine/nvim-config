return {
	{
		"stevearc/oil.nvim",
		dependencies = {
			{ "echasnovski/mini.icons", opts = {} },
			{ "nvim-tree/nvim-web-devicons", opts = {} },
		},
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			theme = "catppuccin",
		},
	},
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			strict = true,
			override_by_extension = {
				["c"] = {
					icon = "󰙱",
					color = "#5c6bc0",
					name = "c",
				},
				["h"] = {
					icon = "󰰀",
					color = "#7E60BF",
					name = "h",
				},
			},
			override_by_filename = {
				["Makefile"] = {
					icon = "",
					color = "#A8CD89",
					name = "Makefile",
				},
			},
		},
	},
}
