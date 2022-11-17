local M = {}

local whichkey = require "which-key"

function M.setup ()

	local wrapping = require "wrapping"

	wrapping.setup {
		opts = {
			create_keymappings = false
		}
	}

	local keymap_z = {
		["z"] = { "<cmd>lua require('wrapping').soft_wrap_mode()<cr>", "Soft wrap mode"},
		["Z"] = { "<cmd>lua require('wrapping').hard_wrap_mode()<cr>", "Hard wrap mode"}
	}

	whichkey.register(keymap_z, {prefix = "<leader>"})
end

return M
