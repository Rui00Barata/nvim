local M = {}

local whichkey = require "which-key"

function M.setup()

	local nterminal = require "nvim-terminal"

	nterminal.setup {
		disable_default_keymaps = true,
	}

	local keymap_t = {
		T = {
			name = "Terminal",
			[";"] = { "<cmd>lua NTGlobal['terminal']:toggle()<cr>", "Toogle terminal"},
			["1"] = { "<cmd>lua NTGlobal['terminal']:open(1)<cr>", "Open terminal 1" },
			["2"] = { "<cmd>lua NTGlobal['terminal']:open(2)<cr>", "Open terminal 2" },
			["3"] = { "<cmd>lua NTGlobal['terminal']:open(3)<cr>", "Open terminal 3" },
		}
	}

	whichkey.register(keymap_t, { prefix = "<leader>"})
end

return M
