local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
		profile = {
			enable = true,
			threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},

    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Colorscheme
--    use({
--      'projekt0n/github-nvim-theme',
--      config = function()
--        require('github-theme').setup({
--          theme_style = "dimmed",
--        })
--      end
--    })
		use {
      "sainnhe/everforest",
      config = function()
        vim.cmd "colorscheme everforest"
      end,
    }
--		use { 'junegunn/seoul256.vim' }

		-- Nvim-Terminal
		use {
			's1n7ax/nvim-terminal',
			config = function()
					vim.o.hidden = true
					require('config.nvim-terminal').setup()
			end,
		}

		-- Signature Completion
--		use {
--			"ray-x/lsp_signature.nvim",
--			config = function ()
--				require "lsp_signature".setup({
--						bind = true, -- This is mandatory, otherwise border config won't get registered.
--						doc_lines = 0,
--						hint_enable = false,
--						handler_opts = {
--							border = "rounded"
--						}
--				})
--			end,
--		}

		-- VimTex
		use {
			'lervag/vimtex',
			ft = {'tex'},
--			config = function ()
--				require("config.vimtex").setup()
--			end,
		}


		-- Symbols Outline
		use {
			'simrat39/symbols-outline.nvim',
			config = function ()
				require("symbols-outline").setup()
			end,
		}

		-- Wrapping
		use {
			"andrewferrier/wrapping.nvim",
			config = function()
					require("config.wrapping").setup()
			end,
    }

    -- NeoGit
    use {
      "NeogitOrg/neogit",
			cmd = "Neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

		-- WhichKey
		use {
			 "folke/which-key.nvim",
			 config = function()
				 require("config.whichkey").setup()
			 end,
		}

		-- Load only when require
    use { "nvim-lua/plenary.nvim", module = "plenary" }

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      opt = true,
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("Comment").setup {}
      end,
    }

    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
      ft = "markdown",
      cmd = { "MarkdownPreview" },
    }

		-- Vim-Matchup
		use { "andymass/vim-matchup" }

		-- Treesitter
		use {
			"nvim-treesitter/nvim-treesitter",
			opt = true,
			event = "BufRead",
			run = ":TSUpdate",
			config = function()
				require("config.treesitter").setup()
			end,
		}

		-- Nvim-Tree
		use {
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			cmd = { "NvimTreeToggle", "NvimTreeClose" },
			config = function()
				require("config.nvimtree").setup()
			end,
		}

		-- Dressing
		use {
			"stevearc/dressing.nvim",
			event = "BufEnter",
			config = function()
				require("dressing").setup {
					select = {
						backend = { "telescope" },
					},
				}
			end,
		}

		-- Telescope
		use {
			"nvim-telescope/telescope.nvim",
			module = "telescope",
			as = "telescope",
			config = function()
				require("config.telescope").setup()
			end,
		}

		-- BufferLine
		use {
			"akinsho/nvim-bufferline.lua",
			event = "BufReadPre",
			wants = "nvim-web-devicons",
			config = function()
				require("config.bufferline").setup()
			end,
		}

		-- Nvim-CMP
		use {
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			opt = true,
			config = function()
				require("config.cmp").setup()
			end,
			wants = { "LuaSnip" },
			requires = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp",
				{
					"L3MON4D3/LuaSnip",
					wants = "friendly-snippets",
					config = function()
						require("config.luasnip").setup()
					end,
				},
				"rafamadriz/friendly-snippets",
				disable = false,
			}
		}

		-- Auto Pairs
		use {
			"windwp/nvim-autopairs",
			wants = "nvim-treesitter",
			module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
			config = function()
				require("config.autopairs").setup()
			end,
		}

		-- LSP
		use {
			"neovim/nvim-lspconfig",
			wants = { "nvim-lsp-installer" },
			config = function()
				require("config.lsp").setup()
			end,
			requires = {
				"williamboman/nvim-lsp-installer",
			},
		}


    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
