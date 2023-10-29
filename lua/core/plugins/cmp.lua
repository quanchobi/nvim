return {
    {   "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        -- Options to pass to configuration
        opts = {
            -- List all completion sources here
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            },
            -- Snippet expansion
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
        },
        -- configuration
        config = function(_, opts)
            -- Function to determine if a space or word is before the cursor, for smart tabbing
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local kind = require("lspkind")

            cmp.setup({
                window = {
                    completion = {
                        border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
                    },
                    documentation = {
                        border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
                    },
                },
                formatting = {
                    format = kind.cmp_format(),
                },
                sources = opts.sources,
                snippet = opts.snippet,
                -- couldn't put keymap in opts, so it's here instead
                mapping = {
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

                    ["<CR>"] = cmp.mapping.confirm { select = false },
                },
            })
        end,
        dependencies = {
            -- autocomplete sources
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            { "hrsh7th/cmp-nvim-lsp", dependencies = "neovim/nvim-lspconfig" },
            { "saadparwaiz1/cmp_luasnip",
                dependencies = {
                    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
                    { "rafamadriz/friendly-snippets",
                      config = function()
                          require("luasnip.loaders.from_vscode").lazy_load()
                      end
                    }
                },
            },
            { "onsails/lspkind.nvim" }
        },
    },
}
