return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		priority = 1000,
		keys = {
			{
				"<leader>ct",
				function()
					vim.cmd("Themery")
				end,
				desc = "[c]hange-[t]heme",
			},
		},
		config = function(_, opts)
			local available_colorschemes = vim.fn.getcompletion("", "color")
			local colorschemes = {}
			for _, colorscheme in ipairs(available_colorschemes) do
				table.insert(colorschemes, colorscheme)
			end
			require("themery").setup({
				livePreview = true,
				themes = colorschemes,
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 4000,
		opts = {
			transparent_background = true,
			styles = {
				comments = { "italic" },
				types = { "italic" },
				functions = { "bold" },
			},
			integrations = {
				noice = true,
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = true,
			},
		},
	},
	{
		"loctvl842/monokai-pro.nvim",
		opts = {
			background_clear = {
				"float_win",
				"notify",
				"telescope",
				"lualine",
			},
			styles = {
				keyword = { bold = true },
				type = { italic = true },
			},
			override = function(c)
				return {
					["@lsp.type.parameter"] = { fg = c.base.blue },
					Type = { fg = c.base.cyan },
				}
			end,
		},
	},
	{
		"folke/tokyonight.nvim",
		priority = 4000,
		lazy = false,
		opts = {
			style = "moon",
			light_style = "day",
			styles = {
				comments = { italic = true },
			},
			plugins = {
				bufferline = true,
				telescope = true,
				cmp = true,
				lazy = true,
				treesitter = true,
			},
		},
	},
	{
		"rebelot/kanagawa.nvim",
		name = "Katsushika Hokusai",
		priority = 4000,
		lazy = false,
		config = function()
			local s, kanagawa = pcall(require, "kanagawa")
			if s == 0 then
				print("Failed to load kanagawa.nvim")
				return
			end
			kanagawa.setup({
				compile = false,
				undercurl = false,
				commenStyle = { italic = true },
				functionStyle = {},
				statementStyle = { bold = false },
				typeStyle = {},
				keywordStyle = {},
				transparent = true,
				dimInactive = false,
				terminalColors = true,
				theme = "wave",
				background = {
					dark = "wave",
					light = "lotus",
				},
			})
		end,
	},
}
