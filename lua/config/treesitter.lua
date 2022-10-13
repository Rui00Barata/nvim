local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    -- A list of parser names, or "all"
    ensure_installed = {
			"bash", "c", "cpp", "html", "javascript", "lua", "markdown", "menhir", "ocaml", "ocaml_interface", "ocamllex", "python", 
		},

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,
    },

		matchup = {
			enable = true,
		}
  }
end

return M
