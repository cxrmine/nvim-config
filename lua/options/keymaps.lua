local keymap = vim.keymap
local opts = { silent = true, noremap = true }

-- split the window
keymap.set("n", "ss", function() return vim.cmd("split") end, opts)
keymap.set("n", "sv", function() return vim.cmd("vsplit") end, opts)

-- source current lua file
keymap.set("n", "<leader>sc", function() return vim.cmd("source %") end, opts)

-- save and exit all
keymap.set("n", "<leader>Q", function() return vim.cmd("wqa") end, opts)

-- window navigation
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sl", "<C-w>l")
