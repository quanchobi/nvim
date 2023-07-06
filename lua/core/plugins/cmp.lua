return {
    {'L3MON4D3/LuaSnip',
    dependencies =
    {'rafamadriz/friendly-snippets'},
        config = function()
            -- import luasnip plugin safely
            local luasnip_status, luasnip = pcall(require, 'luasnip')
            if not luasnip_status then
                return
            end
            luasnip.config.set_config({
                enable_autosnippets = true,
            })
        end
    },
    {'hrsh7th/nvim-cmp',
    dependencies = {
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-cmdline'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},
    },
    event='InsertEnter',
    opts = function()
        -- Defining local functions/consts
        -- Protected call of nvim-cmp
        local cmp_status, cmp = pcall(require, 'cmp')
        if not cmp_status then
            return
        end

        local snip_status, luasnip = pcall(require, 'luasnip')
        if not snip_status then
            return
        end

        -- Local function to detect words before cursor for tab autocompletion
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        -- Icons that illustrate type of completion
        local kind_icons = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = ""
        }

        return {
            sources = cmp.config.sources {
                { name = "nvim_lsp", priority = 1000 },
                { name = "luasnip", priority = 750 },
                { name = "latex_symbols", priority = 625 },
                { name = "buffer", priority = 500 },
                { name = "path", priority = 250, option = { trailing_slash = false}},
                { name = 'nvim_lsp_signature_help', priority = 125 },
            },
            -- Snippet Expansion
            snippet = {
                expand = function(args) luasnip.lsp_expand(args.body) end,
            },
            -- Set up lspconfig
            
            -- Formatting
            formatting = {
                format = function(entry, vim_item)
                    -- Kind Icons
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                    -- Sources
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[LaTeX]",
                    })[entry.source.name]
                    return vim_item
                end
            },
            -- Window Decorations
            window = {
                completion = {
                    border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
                    winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
                },
                documentation = {
                    border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
                    winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
                },
            },
            -- Keymappings
            mapping = {
                ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
                ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
                ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
                ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                ["<C-y>"] = cmp.config.disable,
                ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
                ["<CR>"] = cmp.mapping.confirm { select = false },
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
        }
    end
    },
}
