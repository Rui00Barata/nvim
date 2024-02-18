return {
	-- Theme
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('everforest').setup({ background = "soft" })
			require('everforest').load()
		end,
	},

	{ import = "plugins.git" },
}
