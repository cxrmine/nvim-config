return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = { 'c', "lua", "vim", "vimdoc", "cpp", "python" },
		sync_install = false,
		auto_install = false,
		ignore_install = { "markdown", "latex" },
		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 kb
				local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_get_buf_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end
		},
	},
	config = function()
		vim.cmd("TSUpdate")
	end,
}
