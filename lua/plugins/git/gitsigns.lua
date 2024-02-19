local M = { 'lewis6991/gitsigns.nvim' }

function M.config()
	require('gitsigns').setup({
		-- See `:help gitsigns.txt`
		signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
		},

		on_attach = require('keymaps.gitsigns').on_attach,
	})
end

return M
