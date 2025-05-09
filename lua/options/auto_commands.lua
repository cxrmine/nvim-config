local status, conform = pcall(require, "conform")
if not status then
	return print(string.format("Error: Failed to load conform with status: %q", status))
end

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.lua",
	callback = function(args)
		return conform.format({
			bufnr = args.buf,
		}, function()
			return vim.notify(string.format("Formatted: %s", vim.api.nvim_buf_get_name(args.buf)))
		end)
	end,
})
