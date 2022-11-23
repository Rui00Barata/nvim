vim.bo.shiftwidth = 0
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

local whichkey = require("which-key")

whichkey.register({["m"]  = { "<cmd>MarkdownPreview<cr>", "Preview markdown" }}, {buffer = vim.nvim_get_current_buf, prefix = "<leader>"})
