local opts = { silent = true, noremap = true }
local set = vim.keymap.set

-- opens the vim NETRW file explorer
set("n", "<leader>pv", "<CMD>Ex<CR>", opts)

-- opens the colorscheme switcher window
set("n", "<leader>cs", "<CMD>Themery<CR>", opts)

