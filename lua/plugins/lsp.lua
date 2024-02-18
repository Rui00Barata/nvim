local M = {
	-- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{ 'williamboman/mason.nvim', config = true },
		'williamboman/mason-lspconfig.nvim',

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ 'j-hui/fidget.nvim',       opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		'folke/neodev.nvim',
	},
}

local servers = {
	gopls = {},
	yamlls = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = { disable = { 'missing-fields' } },
		},
	},
}

function M.config()
	local on_attach = require('keymaps.lsp').keymaps
	local mason = require('mason')
	local mason_lspconfig = require('mason-lspconfig')

	-- mason-lspconfig requires that these setup functions are called in this order
	-- before setting up the servers.
	mason.setup()
	mason_lspconfig.setup()

	-- Setup neovim lua configuration
	require('neodev').setup()

	-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

	mason_lspconfig.setup {
		ensure_installed = vim.tbl_keys(servers),
	}

	mason_lspconfig.setup_handlers {
		function(server_name)
			require('lspconfig')[server_name].setup {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = servers[server_name],
				filetypes = (servers[server_name] or {}).filetypes,
			}
		end,
	}
end

return M
