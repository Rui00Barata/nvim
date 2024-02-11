local Util = require("lazyvim.util")
local map = vim.keymap.set

-- Remove any leader bind
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- Better escape using "jk" in insert and terminal mode
map("i", "jk", "<ESC>", { noremap = true, silent = true })
map("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Center search results
map("n", "n", "nzz", {silent = true})
map("n", "N", "Nzz", {silent = true})

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', {silent=true})

-- Cancel search highlighting with ESC
map("n", "<ESC>", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", {noremap = true, silent = true})

-- Move Lines
map("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })