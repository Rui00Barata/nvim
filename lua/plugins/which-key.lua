local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
	opts ={}
}

function M.config()
	local whichkey = require("which-key")
	local api = require('nvim-tree.api')

	local opts = {
		mode = "n", -- Normal mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	}

	local mappings = {

		t = {
			name = 'Nvim-[T]ree',
			t = { api.tree.toggle, '[T]oggle tree'},
			r = { api.tree.reload, '[R]efresh tree'},
		},
	}

	whichkey.setup()
	whichkey.register(mappings, opts)
end

return M
