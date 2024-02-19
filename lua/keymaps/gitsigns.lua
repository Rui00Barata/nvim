local M = {}

local wk = require('which-key')

function M.on_attach(bufnr)
	local gs = package.loaded.gitsigns

	local function map(mode, l, r, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end

	local navigation = {
		mappings = {
			[']c'] = { function()
				if vim.wo.diff then
					return ']c'
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return '<Ignore>'
			end, 'Jump to next hunk' },
			['[c'] = { function()
				if vim.wo.diff then
					return '[c'
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return '<Ignore>'
			end, 'Jump to previous hunk' },
		},
		opts = {
			mode = { "n", "v" },
			buffer = bufnr,
			noremap = true,
			expr = true,
		}
	}
	wk.register(navigation.mappings, navigation.opts)

	local actions_visual = {
		mappings = {
			['s'] = {
				function()
					gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
				end,
				'[S]tage git hunk',
			},
			['r'] = {
				function()
					gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
				end,
				'[R]eset git hunk',
			},
		},
		opts = {
			mode = "v",
			prefix = "<leader>g",
			buffer = bufnr,
			silent = true,
			noremap = true,
			nowait = false,
		}
	}
	wk.register(actions_visual.mappings, actions_visual.opts)


	local actions = {
		mappings = {
			['s'] = { gs.stage_hunk, '[S]tage hunk' },
			['r'] = { gs.reset_hunk, '[R]eset hunk' },
			['S'] = { gs.stage_buffer, '[S]tage buffer' },
			['u'] = { gs.undo_stage_hunk, '[U]ndo stage hunk' },
			['R'] = { gs.reset_buffer, '[R]eset buffer' },
			['p'] = { gs.preview_hunk, '[P]review hunk' },
			['b'] = {
				function()
					gs.blame_line { full = false }
				end,
				'[B]lame line'
			},
			['d'] = { gs.diffthis, '[D]iff against index' },
			['D'] = {
				function ()
					gs.diffthis '~'
				end,
				'[D]iff against last commit'
			},
		},
		opts = {
			mode = "n",
			prefix = "<leader>g",
			buffer = bufnr,
			silent = true,
			noremap = true,
			nowait = false,
		}
	}
	wk.register(actions.mappings, actions.opts)

	local text_object = {
		mappings = {
			['ih'] = {':<C-U>Gitsigns select_hunk<CR>', 'Select g[i]t [h]unk'}
		},
		opts = {
			mode = { 'o', 'x' },
			buffer = bufnr,
			noremap = true,
			nowait = false,
		}
	}
	wk.register(text_object.mappings, text_object.opts)

	-- Toggles
	--map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
	--map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })
end

return M
