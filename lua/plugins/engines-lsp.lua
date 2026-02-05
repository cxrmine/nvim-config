---@source https://github.com/folke/lazydev.nvim
return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufNewFile", "BufReadPre", "BufReadPost" },
		opts = {
			servers = { "clangd", "pyright", "lua_ls", "ts_ls", "jsonls" },
		},
		dependencies = {
			-- main one
			{ "ms-jpq/coq_nvim", branch = "coq" },
			-- 9000+ Snippets
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = true,
				completion = {
					always = true,
				},
			}
		end,
		config = function(_, opts)
			opts = opts or {}
			local capabilities = require("coq").lsp_ensure_capabilities()

			if opts.servers == nil then
				return print("Error: No configured LSP servers")
			end

			vim.lsp.enable(opts.servers)
			vim.lsp.config("*", { capabilities = capabilities })
			vim.diagnostic.config({ virtual_text = true })

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				on_init = function(client)
					local path = client.workspace_folders[1].name
					if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
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
		end,
	},
	{
		"hardyrafael17/norminette42.nvim",
		opts = {
			runOnSave = true,
			maxErrorsToShow = 5,
			active = true,
		},
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
				typescript = { "eslint_d" },
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
