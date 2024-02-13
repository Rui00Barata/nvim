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
	local nvimTree = require('nvim-tree.api')
	local neogit = require('neogit')

	local opts = {
		mode = "n", -- Normal mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	}

	local comment_mappings = {

		-- Comment -> Option + C
		['ç'] = {
			name = '[C]omment',
			c = { 'Toggle line [c]omment'},
			b = { 'Toggle [b]lock comment'},
		},
	}

	local mappings = {

		-- Existing binds
		['<leader>c'] = { name = '[C]ode',  },
		['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
		['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
		['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
		['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
		-- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
		-- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },

		g = {neogit.open, 'Neo[g]it'},

		t = {
			name = 'Nvim-[T]ree',
			t = { nvimTree.tree.toggle, '[T]oggle tree'},
			r = { nvimTree.tree.reload, '[R]efresh tree'},
		},
	}

	whichkey.setup()
	whichkey.register(comment_mappings, {
		mode = {"n", "v"}, -- Normal mode
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	})
	whichkey.register(mappings, opts)
end

return M
