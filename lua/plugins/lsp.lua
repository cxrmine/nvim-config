return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
				icons = {
					package_installed = "",
					package_uninstalled = "",
					package_pending = "",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufNewFile", "BufReadPre", "BufReadPost" },
		opts = {
			servers = { "clangd", "pyright", "lua_ls" },
		},
		config = function(_, opts)
			opts = opts or {}
			local capabilities = require("blink-cmp").get_lsp_capabilities()

			if opts.servers == nil then
				return print("Error: No configured LSP servers")
			end

			-- enable all cconfigured servers
			-- TODO: add support for mason "ensure installed" servers
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
