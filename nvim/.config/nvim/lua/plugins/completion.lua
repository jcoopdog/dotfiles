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
    {
        "Olical/conjure"
    },
    {
        "PaterJason/cmp-conjure",
        lazy = true,
        config = function()
            local cmp = require("cmp")
            local config = cmp.get_config()
            table.insert(config.sources, { name = "conjure" })
            return cmp.setup(config)
        end,
    },
    {
        "eraserhd/parinfer-rust",
        build = "cargo build --release"
    },
    {
        "abecodes/tabout.nvim",
        lazy = false,
        opts = {
            tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
            backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
            act_as_tab = true, -- shift content if tab out is not possible
            act_as_shift_tab = true, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
            default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
            default_shift_tab = '<C-d>', -- reverse shift default action,
            enable_backwards = true, -- well ...
            completion = true, -- if the tabkey is used in a completion pum
            tabouts = {
              { open = "'", close = "'" },
              { open = '"', close = '"' },
              { open = '`', close = '`' },
              { open = '(', close = ')' },
              { open = '[', close = ']' },
              { open = '{', close = '}' }
            },
            ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
            exclude = {} -- tabout will ignore these filetypes
        }
    }
}
