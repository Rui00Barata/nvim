local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>w<cr>", "Save" },
    ["W"] = { "<cmd>wa<cr>", "Save all" },
    ["q"] = { "<cmd>q<cr>", "Quit" },
    ["Q"] = { "<cmd>qa!<cr>", "Quit all" },
    ["b"] = { "<cmd>bd<cr>", "Close Buffer" },
    ["B"] = { "<cmd>bd!<cr>", "Close Buffer" },

    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    g = {
      name = "Git",
      s = { "<cmd>Neogit<cr>", "Status" },
    },

		f = {
			name = "Files",
			n = { "<cmd>NvimTreeToggle<cr>", "Toogle Nvim-Tree"},
			r = { "<cmd>NvimTreeRefresh<cr>", "Refresh Nvim-Tree"},
			f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
			g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Find Files" },
			b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Find Files" },
		},
 }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
