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
			},
			menu = { draw = { columns = {
				{ "kind_icon", "label", gap = 4, "kind"},
			} } },
		},
	},
}

