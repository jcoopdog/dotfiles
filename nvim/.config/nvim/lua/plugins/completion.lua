local cmp_kinds = {
    Text = "  ",
    Method = "  ",
    Function = "  ",
    Constructor = "  ",
    Field = "  ",
    Variable = "  ",
    Class = "  ",
    Interface = "  ",
    Module = "  ",
    Property = "  ",
    Unit = "  ",
    Value = "  ",
    Enum = "  ",
    Keyword = "  ",
    Snippet = "  ",
    Color = "  ",
    File = "  ",
    Reference = "  ",
    Folder = "  ",
    EnumMember = "  ",
    Constant = "  ",
    Struct = "  ",
    Event = "  ",
    Operator = "  ",
    TypeParameter = "  ",
}
return {
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "FelipeLema/cmp-async-path",
            "onsails/lspkind.nvim",
        },
        opts = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    completion = {
                        -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                        col_offset = 2,
                        side_padding = 0,
                    },
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping(function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                            end
                        else
                            fallback()
                        end
                    end),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                    { name = "async_path" },
                }, {
                    { name = "buffer" },
                }),
                formatting = {
                    -- fields = { "abbr", "kind" },
                    -- format = require("lspkind").cmp_format({ mode = "symbol_text" }),
                    format = function(_, vim_item)
                        vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
                        return vim_item
                    end,
                },
                completion = {
                    autoselect = false,
                },
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "fennel" },
                enable_check_bracket_line = false,
            })
            require("nvim-autopairs").get_rules("'")[1].not_filetypes = { "scheme", "lisp" }
        end,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
        -- opts = function()
        -- 	-- If you want insert `(` after select function or method item
        -- 	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        -- 	local cmp = require("cmp")
        -- 	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        -- end,
        -- opts = {
        --     enable_check_bracket_line = false,
        -- }
    },
    -- {
    --     "Olical/conjure"
    -- },
    -- {
    --     "PaterJason/cmp-conjure",
    --     lazy = true,
    --     config = function()
    --         local cmp = require("cmp")
    --         local config = cmp.get_config()
    --         table.insert(config.sources, { name = "conjure" })
    --         return cmp.setup(config)
    --     end,
    -- },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {
            -- config here lol
        },
    },
    {
        "mluders/comfy-line-numbers.nvim",
        opts = {},
    },
    {
        "eraserhd/parinfer-rust",
        build = "cargo build --release"
    },
    {
        "jbyuki/venn.nvim",
        lazy = false,
        config = function()
            require("venn")
            -- toggle keymappings for venn using <leader>v
            vim.keymap.set('n', '<leader>v', function()
                local venn_enabled = vim.inspect(vim.b.venn_enabled)
                if venn_enabled == "nil" then
                    vim.b.venn_enabled = true
                    vim.cmd[[setlocal ve=all]]
                    -- draw a line on HJKL keystokes
                    vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
                    vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
                    vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
                    vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
                    -- default to box visual
                    vim.api.nvim_buf_set_keymap(0, "n", "v", "<C-v>", { noremap = true })
                    vim.api.nvim_buf_set_keymap(0, "n", "v", "<C-v>", { noremap = true })
                    -- draw a box by pressing "f" with visual selection
                    vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
                else
                    vim.cmd[[setlocal ve=]]
                    vim.api.nvim_buf_del_keymap(0, "n", "J")
                    vim.api.nvim_buf_del_keymap(0, "n", "K")
                    vim.api.nvim_buf_del_keymap(0, "n", "L")
                    vim.api.nvim_buf_del_keymap(0, "n", "H")
                    vim.api.nvim_buf_del_keymap(0, "n", "v")
                    vim.api.nvim_buf_del_keymap(0, "v", "f")
                    vim.b.venn_enabled = nil
                end
            end, { noremap = true})
        end,
    }
}
