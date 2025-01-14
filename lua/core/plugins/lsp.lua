return {
    -- LSPconfig, a way to configure the built in neovim LSP client
    {   "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" }, -- Start server when opening or creating file

        dependencies = {
            { "folke/neoconf.nvim", cmd = "Neoconf", dependencies = { "nvim-lspconfig" } },
            { "folke/neodev.nvim", opts = {} },
            { "williamboman/mason.nvim",
                opts = {},
                config = function(_, opts)
                    local mason = require("mason")
                    mason.setup(opts)
                end,
            },
            { "williamboman/mason-lspconfig.nvim",
                dependencies = { "nvim-lspconfig" },
                opts = {
                    -- Add servers you want installed here (using mason names)
                    ensure_installed = { "lua_ls", "textlsp", "nil_ls", "clangd", "rust_analyzer", "html", "cssls", "bashls" }
                },
                config = function(_, opts)
                    local mason_lsp = require("mason-lspconfig")
                    local lsp = require("lspconfig")

                    mason_lsp.setup(opts)

                    -- Set up all language servers here (maybe this should be a for loop?)
                    lsp.clangd.setup {}
                    lsp.rust_analyzer.setup {}
                    lsp.html.setup {}
                    lsp.cssls.setup {}
                    lsp.bashls.setup {}
                    lsp.nil_ls.setup {}
                    lsp.textlsp.setup {}
                    lsp.lua_ls.setup {}
--                    lsp.stylua.setup {}
                end
            }
        }
    }
}
