local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      number = true,
    },
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
