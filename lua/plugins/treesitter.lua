return {
	{
		"nvim-treesitter/nvim-treesitter",
		name = "treesitter-stable",
		lazy = false,

		-- ref. commit @42fc28b
		-- master branch is deprecated for backward compatibility
		-- make sure to use main instead
		branch = "main",
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
			install_dir = vim.fn.stdpath("data") .. "/site",
			additional_vim_regex_highlighting = true,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function(_, opts)
			opts = opts or {}
			local s, config = pcall(require, "nvim-treesitter")
			if not s then
				return print("Error: Unable to load treesitter configs")
			end
			config.setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		name = "treesitter-rip",
		lazy = false,

		-- ref. commit @42fc28b
		-- master branch is deprecated for backward compatibility
		-- I am using tag v0.9.3 here because some plugins just cry because of the broken version of main branch
		tag = "v0.9.3",
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
			install_dir = vim.fn.stdpath("data") .. "/site",
			additional_vim_regex_highlighting = true,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function(_, opts)
			opts = opts or {}
			local s, config = pcall(require, "nvim-treesitter")
			if not s then
				return print("Error: Unable to load treesitter configs")
			end
			config.setup(opts)
		end,
	},
}
