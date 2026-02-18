return {
	"nvim-treesitter/nvim-treesitter",
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
				disable = function(_, buf)
					local max_filesize = 100 * 1024
					local s, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
					if s and stats and stats.size > max_filesize then
						return true
					end
				end,
			},
			install_dir = vim.fn.stdpath("data") .. "/site",
			additional_vim_regex_highlighting = true,
		})
	end,
}
