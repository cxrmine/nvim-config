return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",

		---@type bufferline.UserConfig
		opts = {
			options = {
				modified_icon = "󰄛",
				separator_style = "slant",
			},
		},
		config = function(_, opts)
			opts = opts or {}
			local bufferline = require("bufferline")
			local highlights = require("catppuccin.groups.integrations.bufferline").get_theme()

			bufferline.setup({
				highlights = highlights,
			})
		end,
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

		---@module "noice.config"
		opts = {
			routes = {
				{
					filter = { event = "msg_show", kind = "shell_out" },
					view = "notify",
					opts = { level = "info", title = "stdout" },
				},
				{
					filter = { event = "msg_show", kind = "shell_err" },
					view = "notify",
					opts = { level = "error", title = "stderr" },
				},
			},
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
			{
				"<leader>tc",
				function()
					return vim.cmd("NvimTreeClose")
				end,
				desc = "closes the tree file explorer",
			},
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
					icon = "",
					color = "#5c6bc0",
					name = "Clang",
				},
				["h"] = {
					icon = "",
					color = "#A020F0",
					name = "CHeader",
				},
				["cpp"] = {
					icon = "",
					color = "#5c6bc0",
					name = "Cpplang",
				},
				["hpp"] = {
					icon = "",
					color = "#A020F0",
					name = "CppHeader",
				},
				["o"] = {
					icon = "",
					color = "#cfcfc4",
					name = "Objectfiles",
				},
				["json"] = {
					icon = "",
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
				["*"] = {
					icon = "",
					color = "#FFB26F",
					name = "executables",
				},
			},
		},
	},
}
