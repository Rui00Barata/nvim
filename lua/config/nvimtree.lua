local M = {}

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

	-- Custom Mappings
  vim.keymap.set('n', '+', api.tree.change_root_to_node, opts('CD'))

end
	

function M.setup()

  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      number = true,
      relativenumber = true,
			
    },
		on_attach = my_on_attach,
    filters = {
      custom = { ".git", ".DS_Store" },
    },
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
		}
  }

end

return M
