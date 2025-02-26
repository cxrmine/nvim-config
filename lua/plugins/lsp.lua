return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufNewFile", "BufReadPre", "BufReadPost" },
		config = function()
			local status, cmp_lsp = pcall(require, "cmp_nvim_lsp")
			if not status then
				return
			end
			local capabilities = cmp_lsp.default_capabilities()

			-- source: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
			local cfg = require("lspconfig")
			cfg.lua_ls.setup({
				capabilities = capabilities,
				on_init = function(client)
					local path = client.workspace_folders[1].name
					if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
						return
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					})
				end,
				settings = {
					Lua = {},
				},
			})
			-- source: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls

			cfg.clangd.setup({ capabilities = capabilities })
			cfg.pyright.setup({ capabilities = capabilities })
			cfg.ast_grep.setup({ capabilities = capabilities })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"onsails/lspkind.nvim",
		},
		event = { "BufNewFile", "BufReadPre", "BufReadPost" },
		config = function()
			local lspkind = require("lspkind")
			local cmp = require("cmp")
			local lspkind = require('lspkind')
			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = {
							menu = 50,
							abbr = 50,
						},
						ellipsis_char = "...",
						show_labelDetails = true,
						before = function(entry, vim_item)
							return vim_item
						end,
					}),
				},
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<C-f>",
				function()
					require("conform").format({
						bufnr = vim.api.nvim_get_current_buf(),
					})
				end,
				desc = "Prettify a file",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				python = { "autopep8" },
			},
		},
	},
	{
		"hardyrafael17/norminette42.nvim",
		config = function()
			local norminette = require("norminette")
			norminette.setup({
				runOnSave = true,
				maxErrorsToShow = 5,
				active = true,
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local ok, lint = pcall(require, "lint")
			if not ok then
				return 0
			end
			lint.linters_by_ft = {
				lua = { "luacheck" },
				c = { "cpplint" },
				python = { "mypy" },
			}
		end,
	},
	{
		"onsails/lspkind.nvim",
		opts = {
			mode = "symbol_text",
			preset = "default",
			symbol_map = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			},
		},
	},
}
