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

	local other = {
		mappings = {
			-- Existing binds
			['c'] = { name = '[C]ode', },
			['d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
			['h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
			['r'] = { name = '[R]ename', _ = 'which_key_ignore' },
			['s'] = { name = '[S]earch', _ = 'which_key_ignore', mode = "v"},
			['t'] = { name = 'Nvim-[T]ree', _ = 'which_key_ignore' },
			-- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
			-- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
			g = { neogit.open, 'Neo[g]it' },
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

	local visual = {
		mappings = {
			name = 'VISUAL <leader>',
			['h'] = { 'Git [H]unk' },
		},
		opts = {
			mode = "v", -- Normal mode
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = false, -- use `nowait` when creating keymaps
		}
	}
	whichkey.register(visual.mappings, visual.opts)
end

return M
