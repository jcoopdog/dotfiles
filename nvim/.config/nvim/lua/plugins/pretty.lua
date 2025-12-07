return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                section_separators = '',
                component_separators = '',
            },
            sections = {
                lualine_c = {'filename',
                    {
                        'tabs',
                        show_modified_status = false,
                        tabs_color = {
                            inactive = 'lualine_c_normal',
                            active = 'lualine_c_inactive',
                        },
                    },
                },
            },
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
    { "pauchiner/pastelnight.nvim" },
    { "drewtempelmeyer/palenight.vim" },
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
    { "dylanaraps/wal.vim",               lazy = false },
    { "nyoom-engineering/oxocarbon.nvim", lazy = false },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                highlight = {
                    "Whitespace",
                    "CursorColumn",
                },
                char = ""
            },
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
    {
        "j-hui/fidget.nvim",
        opts = {
            notification = {
                window = {
                    winblend = 0,
                }
            }
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {

        }
    }
}
