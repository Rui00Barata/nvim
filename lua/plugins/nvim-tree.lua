local M = {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

local function my_on_attach(bufnr)
	local api = require('nvim-tree.api')
	local map = vim.keymap.set

	api.config.mappings.default_on_attach(bufnr)

	-- Custom Mappings
	map('n', '=', api.tree.change_root_to_node, {buffer = bufnr, noremap = true, silent = true, nowait = true })
end


function M.config()
	require("nvim-tree").setup ({
		disable_netrw = true,
		hijack_netrw = true,
		view = {
			number = true,
			relativenumber = true,
		},
			on_attach = my_on_attach,
		filters = {
			custom = { "^\\.git", ".DS_Store" },
		},
		sync_root_with_cwd = true,
		update_focused_file = { enable = true }
	})
end

return M
