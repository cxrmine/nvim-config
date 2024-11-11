return {
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
			local util = require("config.util")
			if not ok then
				return 0
			end
			lint.linters_by_ft = {
				lua = { "luacheck" },
				c = { "cpplint" },
				python = { "mypy" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					local ignored_dirs = {
						"~/code/c-piscine/",
					}
					if util.ignore_dirs(ignored_dirs) then
						return false
					else
						lint.try_lint()
					end
				end,
			})
		end,
	},
}
