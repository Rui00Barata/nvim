local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      number = true,
      relativenumber = true,
    },
    filters = {
      custom = { ".git", ".DS_Store" },
    },
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = true,
		}
  }
end

return M
