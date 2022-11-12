if vim.g.vscode then
  -- VSCode extension
  local api = vim.api
  local g = vim.g
  local opt = vim.opt

  -- Remap leader and local leader to <Space>
  api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
  g.mapleader = " "
  g.maplocalleader = " "

  -- Various Optimizations
  opt.termguicolors = true				-- Enable colors in terminal
  opt.hlsearch = true							-- Set highlight on search
  opt.number = true								-- Make line numbers default
  opt.breakindent = true					-- Enable break indent
  opt.undofile = true							-- Save undo history
  opt.ignorecase = true						-- Case insensitive searching unless /C or capital in search
  opt.smartcase = true						-- Smart case
  opt.updatetime = 250            -- Decrease update time
  opt.signcolumn = "yes"					-- Always show sign column
  opt.clipboard = "unnamedplus"		-- Access system clipboard
  opt.timeoutlen = 300						-- Time in milliseconds to wait for a mapped sequence to complete
  opt.scrolloff = 12							-- Number of lines always above or below the cursor
  opt.splitright = true							-- Number of lines always above or bellow the cursor
  opt.splitbelow = true							-- Number of lines always above or bellow the cursor
  opt.lazyredraw = true							-- Number of lines always above or bellow the cursor

  -- Highlight on yank
  vim.cmd [[
    augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
  ]]

  -- Don't auto commenting new lines
  vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

  local keymap = vim.api.nvim_set_keymap
  local default_opts = { noremap = true, silent = true }
  local expr_opts = { noremap = true, expr = true, silent = true }

  -- Better escape using "jk" in insert and terminal mode
  keymap("i", "jk", "<ESC>", default_opts)
  keymap("t", "jk", "<C-\\><C-n>", default_opts)

  -- Center search results
  keymap("n", "n", "nzz", default_opts)
  keymap("n", "N", "Nzz", default_opts)

  -- Visual line wraps
  keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
  keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

  -- Better indent
  keymap("v", "<", "<gv", default_opts)
  keymap("v", ">", ">gv", default_opts)

  -- Paste over currently selected text without yanking it
  keymap("v", "p", '"_dP', default_opts)

  -- Cancel search highlighting with ESC
  keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

  -- Move selected line / block of text in visual mode
  keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
  keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

  -- Resizing panes
  keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
  keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
  keymap("n", "<Up>", ":resize -1<CR>", default_opts)
  keymap("n", "<Down>", ":resize +1<CR>", default_opts)

  -- Move around split using <C-{h,j,k,l}>
  keymap('n', '<C-h>', '<C-w>h', default_opts)
  keymap('n', '<C-j>', '<C-w>j', default_opts)
  keymap('n', '<C-k>', '<C-w>k', default_opts)
  keymap('n', '<C-l>', '<C-w>l', default_opts)
else
  -- ordinary Neovim
  endrequire("statusline").setup()
  require("plugins").setup()
end