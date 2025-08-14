return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {--[[ things you want to change go here]]
			size = 40,
			open_mapping = [[<C-S>]],
			direction = "float",
			shade_terminals = true,
			persist_size = true,
		},
	},
	{
		"willothy/flatten.nvim",
		config = true,
		-- or pass configuration with
		-- opts = {  }
		-- Ensure that it runs first to minimize delay when opening file from terminal
		lazy = false,
		priority = 1001,
	},
	{
		"vzze/cmdline.nvim",
		opts = {
			cmdtype = ":", -- you can also add / and ? by using ":/?"
			-- as a string

			window = {
				matchFuzzy = true,
				offset = 1, -- depending on 'cmdheight' you might need to offset
				debounceMs = 10, -- the lower the number the more responsive however
				-- more resource intensive
			},

			hl = {
				default = "Pmenu",
				selection = "PmenuSel",
				directory = "Directory",
				substr = "LineNr",
			},

			column = {
				maxNumber = 6,
				minWidth = 20,
			},

			binds = {
				next = "<Tab>",
				back = "<S-Tab>",
			},
		},
	},
}
