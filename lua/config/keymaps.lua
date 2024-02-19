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
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", {noremap = true, silent = true})

-- Move Lines
map("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Resizing panes
map("n", "<Left>", ":vertical resize +1<CR>", {noremap = true, silent = true})
map("n", "<Right>", ":vertical resize -1<CR>", {noremap = true, silent = true})
map("n", "<Up>", ":resize -1<CR>", {noremap = true, silent = true})
map("n", "<Down>", ":resize +1<CR>", {noremap = true, silent = true})


-- Move around split using <C-{h,j,k,l}>
map("n", "<C-h>", "<C-w>h", {noremap = true, silent = true})
map("n", "<C-j>", "<C-w>j", {noremap = true, silent = true})
map("n", "<C-k>", "<C-w>k", {noremap = true, silent = true})
map("n", "<C-l>", "<C-w>l", {noremap = true, silent = true})

-- save file
map({ "x", "n", "s" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })


-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
