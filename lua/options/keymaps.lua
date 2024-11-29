local opts = { silent = true, noremap = true }
local set = vim.keymap.set

set(
	"n",
	"<leader>ft",
	function()
		vim.cmd("Stdheader")
	end,
	{ desc = "[f]orty-[t]wo | adds 42 header on C files" }
)
set(
	"n",
	"<leader>to",
	function()
		vim.cmd("NvimTreeOpen")
	end,
	{ desc = "[t]ree-[o]pen | open the file tree view" }
)
set(
	"n",
	"<leader>tc",
	function ()
		vim.cmd("NvimTreeClose")
	end,
	{ desc = "[t]ree-[c]lose | close the file tree view"}
)
