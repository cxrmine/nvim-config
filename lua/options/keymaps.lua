local opts = { silent = true, noremap = true }
local set = vim.keymap.set
local telescope = require("telescope.builtin")

set("n", "<leader>ft", function()
	vim.cmd("Stdheader")
end, { desc = "[f]orty-[t]wo | adds 42 header on C files" })
set("n", "<leader>to", function()
	vim.cmd("NvimTreeOpen")
end, { desc = "[t]ree-[o]pen | open the file tree view" })
set("n", "<leader>tc", function()
	vim.cmd("NvimTreeClose")
end, { desc = "[t]ree-[c]lose | close the file tree view" })
set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
