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
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		}
  }
end

return M
