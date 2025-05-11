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
			cmdline = {
				keymap = {
					preset = "cmdline",
				},
				enabled = true,
				completion = {
					ghost_text = {
						enabled = true,
					},
				},
			},
			completion = {
				trigger = { show_on_keyword = true },
				menu = {
					border = "rounded",
					scrollbar = false,
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
					window = {
						border = "rounded",
						scrollbar = false,
					},
				},
				ghost_text = { enabled = true },
			},
			signature = { enabled = true },
			sources = {
				default = { "lsp", "buffer", "snippets", "path", "omni", "cmdline", "lazydev" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
}
