local M = {
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
}

function M.config_servers(servers, on_attach)
	local mason = require('mason')
	local mason_lspconfig = require('mason-lspconfig')

	require('plugins.lsp.keymaps')()


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
