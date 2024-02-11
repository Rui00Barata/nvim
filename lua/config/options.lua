local g = vim.g
local opt = vim.opt

-- Global Settings
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.mapleader = ' '
g.maplocalleader = ' '

-- System
opt.clipboard = "unnamedplus" -- Sync with system clipboard

-- Terminal
opt.termguicolors = true -- Enable true color support

-- Lines
opt.number = true         -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true     -- Enable highlighting of the current line
opt.scrolloff = 10        -- Lines of context
opt.sidescrolloff = 10    -- Columns of context
opt.wrap = false          -- Disable line wrap
opt.signcolumn = "yes"    -- Always show the signcolumn, otherwise it would shift the text each time
opt.shiftround = true     -- Round indent
opt.shiftwidth = 4        -- Size of an indent
opt.tabstop = 4           -- Number of spaces tabs count for
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode

-- Files
opt.undofile = true    -- Allows for persistent undo files, even across sessions
opt.undolevels = 10000 -- Maximum number of changes that can be undone in the undo history

-- Search/Sub
opt.ignorecase = true          -- Case is ignored when searching text
opt.smartcase = true           -- Don't ignore case with capitals
opt.grepformat = "%f:%l:%c:%m" -- Format for displaying search results
opt.grepprg = "rg --vimgrep"   -- Use ripgrep to search
opt.inccommand = "nosplit"     -- preview incremental substitute

-- Times
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.timeoutlen = 300 -- Time in milliseconds Neovim waits for mapped key sequences to complete
opt.updatetime = 200 -- Save swap file and trigger CursorHold

-- Windows
opt.splitright = true    -- Put new windows right of current
opt.splitbelow = true    -- Put new windows below current
opt.splitkeep = "screen" -- Keep the text on the same screen line when opening, closing or resizing horizontal splits
opt.winminwidth = 5      -- Minimum window width

--Completion
opt.completeopt = "menu,menuone,noselect" -- Display a completion menu with all available completions
opt.wildmode = "longest:full,full"        -- Command-line completion mode

-- Popups
opt.pumblend = 10                                                -- Popup blend
opt.pumheight = 10                                               -- Maximum number of entries in a popup
opt.shortmess:append({ W = true, I = true, c = true, C = true }) -- Neovim will suppress some type of messages

-- Text
opt.spelllang = { "en", "pt" }                                       -- Languages to use for spell checking
opt.formatoptions = "jcroqlnt"                                       -- tcqj
opt.smartindent = true                                               -- Insert indents automatically
opt.expandtab = false                                                -- Use tabs instead of spaces
vim.o.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()" -- Dynamic formatting mechanism
opt.conceallevel = 2                                                 -- Hide * markup for bold and italic, but not markers with substitutions

-- Status Line
opt.laststatus = 3   -- global statusline
opt.showmode = false -- Dont show mode since we have a statusline

-- Session
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" } -- What should be saved about a session
