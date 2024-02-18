local M = {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

function M.config()
	local nt_keymaps = require('keymaps.nvim-tree')

	require("nvim-tree").setup({
		disable_netrw = true,
		hijack_netrw = true,
		view = {
			number = true,
			relativenumber = true,
		},
		on_attach = nt_keymaps.on_attach,
		filters = {
			custom = { "^\\.git$", ".DS_Store" },
		},
		sync_root_with_cwd = true,
		update_focused_file = { enable = true }
	})

	nt_keymaps.set_keymaps()
end

return M
