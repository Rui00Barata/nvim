local M = {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    },
}

function M.config()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = {
            "go", "gomod", "gosum", "gowork",
            "lua", "luap",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    })
end

return M
