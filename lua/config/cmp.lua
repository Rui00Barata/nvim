local M = {}

function M.setup()

	local luasnip = require "luasnip"
	local cmp = require "cmp"


	cmp.setup {

		completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1},

		experimental = { native_menu = false, ghost_text = true },

		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		formatting = {
			format = function(entry, vim_item)
				vim_item.menu = ({
					buffer = "[Buff]",
					luasnip = "[Snip]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[Lua]",
					path = "[Path]",
				})[entry.source.name]
				return vim_item
			end,
		},

		mapping = {
			["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping { i = cmp.mapping.close(), c = cmp.mapping.close() },
			["<CR>"] = cmp.mapping {
        i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
        c = function(fallback)
          if cmp.visible() then
            cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
          else
            fallback()
          end
        end,
      },
			["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, {
					"i",
					"s",
					"c",
				}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
					"c",
				}),
		},

		sources = {
			{ name = "nvim_lsp", max_item_count = 10 },
			{ name = "luasnip", max_item_count = 1 },
			{ name = "nvim_lua", max_item_count = 5 },
			{ name = "path", max_item_count = 3 },
			{ name = "buffer", max_item_count = 3 },
		},

		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
    }
	}

	-- Use buffer source for `/`
  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':'
  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

	local cmp_autopairs = require "nvim-autopairs.completion.cmp"
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" }})

end

return M
