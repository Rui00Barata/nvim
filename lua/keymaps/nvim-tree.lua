local M = {}

local api = require('nvim-tree.api')
local wk = require('which-key')

function M.set_keymaps()
	local global_keymaps = {
		mappings = {
			name = 'Nvim-[T]ree',
			t = { api.tree.toggle, '[T]oggle tree' },
			r = { api.tree.reload, '[R]efresh tree' },
		},
		opts = {
			mode = { "n", "v" },
			prefix = "<leader>t",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = false,
		}
	}

	wk.register(global_keymaps.mappings, global_keymaps.opts)
end

function M.on_attach(bufnr)
	api.config.mappings.default_on_attach(bufnr)

	-- Custom Mappings
	local buf_keymaps = {
		mappings = {
			['='] = { api.tree.change_root_to_node, '[T]oggle tree' },
		},
		opts = {
			mode = "n",
			buffer = bufnr,
			silent = true,
			noremap = true,
			nowait = true,
		}
	}

	wk.register(buf_keymaps.mappings, buf_keymaps.opts)
end

return M
