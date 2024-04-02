local M = {}

local wk = require('which-key')

function M.keymaps(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>ca', function()
		vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
	end, '[C]ode [A]ction')

	-- See `:help K` for why this keymap
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	local lsp = {
		mappings = {
			name = '[L]SP',
			r = { vim.lsp.buf.rename, '[R]ename' },
			s = { require('telescope.builtin').lsp_document_symbols, 'Document [S]ymbols' },
			a = {
				function()
						vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
				end,
				'[C]ode [A]ction'
			}
		},
		opts = {
			mode = "n",
			prefix = "<leader>l",
			buffer = bufnr,
			noremap = true,
		}
	}
	wk.register(lsp.mappings, lsp.opts)

	local goto = {
		mappings = {
			name = 'Goto',
			d = { require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition' },
			t = { require('telescope.builtin').lsp_type_definitions, '[T]ype Definition' },
			r = { require('telescope.builtin').lsp_references, '[G]oto [R]eferences' },
			I = { require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation' },
			D = { vim.lsp.buf.declaration, '[G]oto [D]eclaration' },
		},
		opts = {
			mode = "n",
			prefix = "<leader>lg",
			buffer = bufnr,
			noremap = true,
		}
	}
	wk.register(goto.mappings, goto.opts)

	local workspace = {
		mappings = {
			name = '[W]orkspace',
			r = { vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder' },
			a = { vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder' },
			l = {
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
				'[W]orkspace [L]ist Folders' },
			s = { require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols' }
		},
		opts = {
			mode = "n",
			prefix = "<leader>lw",
			buffer = bufnr,
			noremap = true,
		}
	}
	wk.register(workspace.mappings, workspace.opts)

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })

	vim.keymap.set({ "x", "n", "s" }, "<leader>fw", "<cmd>Format<cr><bar><cmd>w<cr><esc>",
		{ buffer = bufnr })

	vim.keymap.set({ "x", "n", "s" }, "<leader>fW", "<cmd>Format<cr><bar><cmd>wa<cr><esc>",
		{ buffer = bufnr })
end

return M
