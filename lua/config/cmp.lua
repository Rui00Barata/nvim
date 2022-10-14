local M = {}

function M.setup()
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line-1, line, true)[1]:sub(col,col):match "%s" == nil
	end

	local luasnip = require "luasnip"
	local cmp = require "cmp"

	cmp.setup {

		completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1, max_item_count = 10 },

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
					nvim_lua = "[Lua]",
					nvim_lsp = "[LSP]",
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
		},

		sources = {
			{ name = "nvim_lua" },
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "buffer", keyword_length = 5 },
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
end

return M
