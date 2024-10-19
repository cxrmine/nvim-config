return {
	"mfussenegger/nvim-lint",
	config = function()
		local ok, lint = pcall(require, "lint")
		if not ok then
			return 0
		end
		lint.linters_by_ft = {
			lua = { "luacheck" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
