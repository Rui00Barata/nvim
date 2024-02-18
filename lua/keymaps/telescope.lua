local M = {}

local wk = require('which-key')
local tbi = require('telescope.builtin') -- See `:help telescope.builtin`

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
	-- Use the current buffer's path as the starting point for the git search
	local current_file = vim.api.nvim_buf_get_name(0)
	local current_dir
	local cwd = vim.fn.getcwd()
	-- If the buffer is not associated with a file, return nil
	if current_file == '' then
		current_dir = cwd
	else
		-- Extract the directory from the current file's path
		current_dir = vim.fn.fnamemodify(current_file, ':h')
	end

	-- Find the Git root directory from the current file's path
	local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
	if vim.v.shell_error ~= 0 then
		print 'Not a git repository. Searching on current working directory'
		return cwd
	end
	return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
	local git_root = find_git_root()
	if git_root then
		tbi.live_grep {
			search_dirs = { git_root },
		}
	end
end

local function telescope_live_grep_open_files()
	tbi.live_grep {
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	}
end


function M.keymaps()

	local files = {
		mappings = {
			name = '+[F]iles',
			[' '] = { tbi.buffers, 'Show open buffers' },
			['r'] = { tbi.oldfiles, '[R]ecently opened files' },
			['f'] = { tbi.find_files, '[F]iles in Directory' },
		},
		opts = {
			mode = "n",
			prefix = "<leader>f",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = false,
		}
	}
	wk.register(files.mappings, files.opts)
	vim.keymap.set('n', '<leader>sf', tbi.find_files, { desc = '[S]earch [F]iles' })

	local search = {
		mappings = {
			name = '+[Search]',
			['f'] = { function()
					-- You can pass additional configuration to telescope to change theme, layout, etc.
					tbi.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
						winblend = 10,
						previewer = false,
					})
				end, 'Search in current [f]ile' },
			['o'] = {telescope_live_grep_open_files, 'Search in [O]pen files'},
			['t'] = {tbi.builtin, 'Search [T]elescope'},
			['h'] = {tbi.help_tags, 'Search [H]elp'},
			['w'] = {tbi.grep_string, 'Search [W]ord', mode = {"n", "v"}},
			['d'] = {tbi.live_grep, 'Search Working [D]irectory'},
			['g'] = {tbi.git_files, 'Search [G]it files'},
			['G'] = {live_grep_git_root, 'Search [G]it Root'},
			['l'] = {tbi.diagnostics, 'Search [L]SP diagnostics'},
			['r'] = {tbi.resume, 'Search [R]esume'},
		},
		opts = {
			mode = "n",
			prefix = "<leader>s",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = false,
		}
	}
	wk.register(search.mappings, search.opts)
end

return M
