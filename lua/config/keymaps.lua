-- This file is automatically loaded by lazyvim.config.init

local Util = require("lazyvim.util")

local map = vim.keymap.set

-- Better escape in insert and terminal mode
map("i", "jk", "<ESC>", { silent = true })
map("t", "jk", "<C-\\><C-n>", { silent = true })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resizing panes
map("n", "<Left>", ":vertical resize +1<CR>", { desc = "Increase window width" })
map("n", "<Right>", ":vertical resize -1<CR>", { desc = "Decrease window width" })
map("n", "<Up>", ":resize -1<CR>", { desc = "Decrease window height" })
map("n", "<Down>", ":resize +1<CR>", { desc = "Increase window height" })
