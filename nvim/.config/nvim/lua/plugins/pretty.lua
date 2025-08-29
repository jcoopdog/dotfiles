return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"nanozuki/tabby.nvim",
		---@type TabbyConfig
		opts = {
			-- configs...
		},
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
		},
	},
	-- { "rcarriga/nvim-notify" },
	-- { "MunifTanjim/nui.nvim" },
	{ "mcauley-penney/techbase.nvim" },
	{ "kyren223/carbonight.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		opts = {},
	},
	{
		dir = "~/.config/nvim/InvertCmpColors",
		lazy = false,
		-- opts = {},
	},
	{ "dylanaraps/wal.vim", lazy = false },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = false },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = { highlight = {
				"Whitespace",
				"CursorColumn",
			}, char = "" },
			whitespace = {
				highlight = {
					"Whitespace",
					"CursorColumn",
				},
				remove_blankline_trail = false,
			},
			scope = { enabled = false },
		},
	},
}
