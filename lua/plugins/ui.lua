return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			local tree = require("nvim-tree")
			tree.setup()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true
		end,
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
}
