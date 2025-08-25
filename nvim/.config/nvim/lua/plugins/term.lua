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
	-- {
	-- 	"vzze/cmdline.nvim",
	-- 	opts = {},
	-- },
}
