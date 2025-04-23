return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				modified_icon = "󰄛",
				separator_style = "slant",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons", opts = {} },
		},
		cmd = { "OIL" },
		keys = {
			{ "-", "<CMD>Oil<CR>", desc = "opens current file tree in a new vim buffer" },
		},
		opts = {
			columns = {
				"size",
				"icon",
			},
		},
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
			theme = "",
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeOpen" },
		keys = {
			{ "<leader>to", "<CMD>NvimTreeOpen<CR>", desc = "opens tree file explorer" },
		},
		opts = {
			renderer = {
				icons = {
					glyphs = {
						git = {
							unstaged = "󱪡",
							staged = "󰝒",
							renamed = "󰤘",
							untracked = "󱀶",
							deleted = "󰮘",
							ignored = "󰘓",
						},
					},
				},
			},
		},
	},
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			strict = true,
			override_by_extension = {
				["c"] = {
					icon = "",
					color = "#5c6bc0",
					name = "c",
				},
				["h"] = {
					icon = "",
					color = "#A020F0",
					name = "H",
				},
				["json"] = {
					icon = "",
					color = "#e67f19",
					name = "JSON",
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
