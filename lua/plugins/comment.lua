local M = { 'numToStr/Comment.nvim' }

function M.config()
	require('Comment').setup ({
		mappings = { basic = false, extra = false }
	})

    local api = require('Comment.api')
	local map = vim.keymap.set

	-- Toggle comment in normal mode
	map('n', 'çc', api.toggle.linewise.current)
	map('n', 'çb', api.toggle.blockwise.current)

	-- Toggle comment in visual mode
	local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
	map('x', 'çc', function()
		vim.api.nvim_feedkeys(esc, 'nx', false)
		api.toggle.linewise(vim.fn.visualmode())
	end)
	map('x', 'çb', function()
		vim.api.nvim_feedkeys(esc, 'nx', false)
		api.toggle.blockwise(vim.fn.visualmode())
	end)

end

return M
