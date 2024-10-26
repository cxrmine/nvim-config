local opts = { silent = true, noremap = true }
local set = vim.keymap.set

-- opens the vim NETRW file explorer
set("n", "<leader>pv", "<CMD>Ex<CR>", opts)

-- opens the colorscheme switcher window
set("n", "<leader>cs", "<CMD>Themery<CR>", opts)

-- source: https://github.com/nvim-telescope/telescope.nvim
local builtin = require("telescope.builtin")
set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- source: https://github.com/nvim-telescope/telescope.nvim

local conform = require("conform")
set("n", "<C-f>", function()
	conform.format({
		bufnr = vim.api.nvim_get_current_buf(),
	})
end, vim.tbl_extend("force", opts, { desc = "Format files depending on their LSPs" }))

set("n", "<leader>ft", function()
	vim.cmd("Stdheader")
end, { desc = "[f]orty-[t]wo | adds 42 header on C files" })
