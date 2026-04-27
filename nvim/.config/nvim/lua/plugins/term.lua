return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = { --[[ things you want to change go here]]
            size = 40,
            open_mapping = [[<C-S>]],
            direction = "horizontal",
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
        opts = {},
    },
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required

            -- Only one of these is needed.
            "esmuellert/codediff.nvim",      -- optional

            -- For a custom log pager
            "m00qek/baleia.nvim",            -- optional

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
        },
        cmd = "Neogit",
        keys = {
          { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        }
    },
}
