return {
	{

		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 3000,
		opts = {
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
				disable = function(lang, buf)
					local max_filesize = 100 * 1024
					local s, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if s and stats and stats.size > max_filesize then
						return true
					end
				end,
			},
			additional_vim_regex_highlighting = true,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function (_, opts)
			opts = opts or {}
			local s, config = pcall(require, "nvim-treesitter.configs")
			if s == 0 then
				return print("Error: Unable to load treesitter configs")
			end
			config.setup(opts)
		end
	}
}
