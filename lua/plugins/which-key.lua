local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {}
}

function M.config()
	local whichkey = require("which-key")
	local neogit = require('neogit')

	whichkey.setup()


	local comment = { -- Comment -> Option + C
		mappings = {
				name = '[C]omment',
				c = { 'Toggle line [c]omment' },
				b = { 'Toggle [b]lock comment' },
		},
		opts = {
			mode = { "n", "v" }, -- Normal mode
			prefix = "ç",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = false, -- use `nowait` when creating keymaps
		}
	}
	whichkey.register(comment.mappings, comment.opts)
-- quit

	local quit_and_save = {
		mappings = {
			name = 'File Settings',
			['w'] = {'<cmd>w<cr>', 'Save'},
			['W'] = {'<cmd>wa<cr>', 'Save all'},
			['q'] = {'<cmd>q<cr>', 'Quit'},
			['qq'] = {'<cmd>q!<cr>', 'Quit without saving'},
			['Q'] = {'<cmd>qa<cr>', 'Quit all'},
			['b'] = {'<cmd>bd<cr>', 'Close buffer'},
			['B'] = {'<cmd>b!<cr>', 'Close buffer without saving'},
		},
		opts = {
			mode = "n", -- Normal mode
			prefix = "<leader>q",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = false, -- use `nowait` when creating keymaps
		}
	}
	whichkey.register(quit_and_save.mappings, quit_and_save.opts)

	local other = {
		mappings = {
			-- Existing binds
			['c'] = { name = '[C]ode', },
			['d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
			['r'] = { name = '[R]ename', _ = 'which_key_ignore' },
			['s'] = { name = '[S]earch', _ = 'which_key_ignore', mode = "v"},
			['t'] = { name = 'Nvim-[T]ree', _ = 'which_key_ignore' },
			['g'] = { name = '[G]it', _ = 'which_key_ignore', mode = { 'n', 'v' }},
			-- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
			['gg'] = { neogit.open, 'Neo[g]it' },
		},
		opts = {
			mode = "n", -- Normal mode
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = false, -- use `nowait` when creating keymaps
		}
	}
	whichkey.register(other.mappings, other.opts)
end

return M
