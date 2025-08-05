return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		config = function()
			local ts = require("nvim-treesitter.configs")
			ts.setup({
				modules = {},
				auto_install = true,
				ensure_installed = {
					"c",
					"lua",
					"cpp",
					"make",
					"comment",
					"typescript",
					"bash",
					"vim",
					"vimdoc",
					"regex",
					"markdown",
					"markdown_inline",
				},
				sync_install = true,
				ignore_install = { "javascript" },
				highlight = {
					enable = true,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024
						local s, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if s and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
				install_dir = vim.fn.stdpath("data") .. "/site",
				additional_vim_regex_highlighting = true,
			})
		end,
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		priority = 1000,
		tag = "v2.0.1",
		keys = {
			{
				"<leader>ct",
				function()
					vim.cmd("Themery")
				end,
				desc = "[c]hange-[t]heme",
			},
		},
		config = function()
			local available_colorschemes = vim.fn.getcompletion("", "color")
			local colorschemes = {}
			local toTitleCase = require("options.utils").toTitleCase
			for _, colorscheme in ipairs(available_colorschemes) do
				local transformed = toTitleCase(colorscheme)
				table.insert(colorschemes, {
					colorscheme = colorscheme,
					name = transformed,
				})
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

		---@module "catppuccin"
		---@type CatppuccinOptions
		opts = {
			float = {
				solid = true,
				transparent = false,
			},
			---@type CtpIntegrations
			integrations = {
				noice = true,
				gitsigns = true,
				treesitter = true,
				notify = true,
				blink_cmp = {
					style = "bordered",
				},
				treesitter_context = true,
				telescope = {
					enabled = true,
				},
				which_key = true,
			},
			term_colors = true,
			transparent_background = true,

			---@type CtpStyles
			styles = {
				comments = { "italic" },
				booleans = { "bold" },
				types = { "bold" },
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
		priority = 4000,
		lazy = false,
		opts = {
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
		},
		config = true,
	},
	{
		"fladson/vim-kitty",
		ft = "kitty",
		tag = "v1.4", -- You can select a tagged version
	},
}
