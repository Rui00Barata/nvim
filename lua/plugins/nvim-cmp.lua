local M = {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
		{
			'L3MON4D3/LuaSnip',
			build = (function()
				-- Build Step is needed for regex support in snippets
				-- This step is not supported in many windows environments
				-- Remove the below condition to re-enable on windows
				if vim.fn.has 'win32' == 1 then
				return
				end
				return 'make install_jsregexp'
			end)(),
		},
		'saadparwaiz1/cmp_luasnip',

		-- Adds LSP completion capabilities
		'hrsh7th/cmp-nvim-lsp',
		'FelipeLema/cmp-async-path',

		-- Adds a number of user-friendly snippets
		'rafamadriz/friendly-snippets',
    },
}

function M.config()
	local cmp = require 'cmp'
	local luasnip = require 'luasnip'
	require('luasnip.loaders.from_vscode').lazy_load()
	luasnip.config.setup {}

	cmp.setup {

		completion = {
			completeopt = 'menu,menuone,noinsert',
		},
		experimental = { native_menu = false, ghost_text = true },
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		formatting = {
			format = function(entry, vim_item)
				vim_item.menu = ({
					luasnip =  	 "[Snp]",
					nvim_lsp =   "[LSP]",
					async_path = "[Pth]",
				})[entry.source.name]
				return vim_item
			end,
		},
		mapping = cmp.mapping.preset.insert {
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete {},
			['<CR>'] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			},
			['<Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
				end, { 'i', 's' }
			),
			['<S-Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
				end, { 'i', 's' }
			),
		},
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'async_path' },
		},
	}

	-- Use cmdline & path source for ':'
	cmp.setup.cmdline(":", {
		sources = cmp.config.sources(
			{{ name = "path" },},
			{{ name = "cmdline" },}
		),
	})

	local cmp_autopairs = require "nvim-autopairs.completion.cmp"
	cmp.event:on(
		'confirm_done',
		cmp_autopairs.on_confirm_done { map_char = { tex = "" }}
	)

end

return M
