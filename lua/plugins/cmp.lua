return {
	{
		'saghen/blink.cmp',
		dependencies = {
			"rafamadriz/friendly-snippets"
		},
		version = "1.*",

		---@module 'blink-cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = 'default',
				['<C-j>'] = { "select_next", "fallback" },
				['<C-k>'] = { "select_prev", "fallback" },
				['<C-space>'] = {
					function(cmp)
						cmp.show({
							providers = { 'snippets' }
						})
					end
				}
			}
		}
	}
}
