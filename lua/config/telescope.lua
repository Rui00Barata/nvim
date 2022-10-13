local M = {}

function M.setup()
	local actions = require("telescope.actions")

	require ("telescope").setup {
		defaults = {
			mappings = {
				i = {
					["<C-s>"} = actions.file_split,
				}
			}
		}
end

return M
