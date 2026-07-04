return {
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
}
