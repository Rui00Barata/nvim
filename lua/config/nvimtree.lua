local M = {}

function M.setup()
  require("nvim-tree").setup {
		sync_root_with_cmd = true,
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      number = true,
    },
    filters = {
      custom = { ".git", ".DS_Store" },
    },
  }
end

return M
