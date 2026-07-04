return {
	"saghen/blink.cmp",
	version = "1.7.0",
	event = "BufReadPre",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = { preset = "enter" },
		fuzzy = { implementation = "prefer_rust" },
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
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbol_map[ctx.kind] or ""
								end

								return icon .. ctx.icon_gap
							end,

							-- Optionally, use the highlight groups from nvim-web-devicons
							-- You can also add the same function for `kind.highlight` if you want to
							-- keep the highlight groups in sync with the icons.
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										hl = dev_hl
									end
								end
								return hl
							end,
						},
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
	cmdline = {
		keymap = {
			preset = "cmdline",
			["<C-space>"] = {
				function(cmp)
					cmp.show({ providers = { "property" } })
				end,
			},
		},
		enabled = true,
	},
	config = function(_, opts)
		opts = opts or {}
		local blink = require("blink-cmp")
		blink.setup(opts)
	end,
}
