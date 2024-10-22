vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		local status, conform = pcall(require, "conform")
		if not status then
			print("Failed to load conform")
			return false
		end
		local util = require("config.util")
		local ignored_dirs = { "~/code/c-piscine/" }
		if util.ignore_paths(ignored_dirs) then
			return false
		else
			conform.format({ bufnr = args.buf })
		end
	end,
})
