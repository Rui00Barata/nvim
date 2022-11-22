local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

-- Various Optimizations
opt.termguicolors = true					-- Enable colors in terminal

opt.hlsearch = true								-- Set highlight on search

opt.number = true									-- Make line numbers default
opt.relativenumber = true					-- Set relative numbers to current line
opt.cursorline = true						-- Highlight current line

opt.breakindent = true						-- Enable break indent

opt.undofile = true								-- Save undo history

opt.ignorecase = true							-- Case insensitive searching unless /C or capital in search
opt.smartcase = true							-- Smart case

opt.updatetime = 250            	-- Decrease update time
opt.timeoutlen = 300							-- Time in milliseconds to wait for a mapped sequence to complete

opt.signcolumn = "yes"						-- Always show sign column

opt.clipboard = "unnamedplus"			-- Access system clipboard

opt.scrolloff = 15								-- Number of lines always above or below the cursor

opt.splitright = true							-- When window splited verticly always split right
opt.splitbelow = true							-- When window splited horizontly always split below

opt.lazyredraw = true

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Don't auto commenting new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Aliases
vim.cmd [[
	command Masters cd ~/Documents/UBI/Masters/
	command Uni cd ~/Documents/UBI/
]]
