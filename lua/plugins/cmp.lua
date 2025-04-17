return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		version = "1.*",

		---@module 'blink-cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "enter" },
			fuzzy = { implementation = "lua" },
			completion = {
				trigger = { show_on_keyword = true },
				menu = {
					draw = {
						treesitter = { "lsp" },
						columns = {
							{ "kind_icon", "label", gap = 4 },
							{ "kind" },
						},
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 400,
				},
				ghost_text = { enabled = true },
			},
			signature = { enabled = true },
			sources = {
				default = { "lsp", "buffer", "snippets", "path" },
			},
		},
	},
}
