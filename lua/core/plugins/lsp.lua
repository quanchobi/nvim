return {
    {'folke/neodev.nvim',
    opts = {
        override = function(root_dir, library)
            for _, astronvim_config in ipairs(astronvim.supported_configs) do
                if root_dir:match(astronvim_config) then
                    library.plugins = true
                    break
                end
            end
            vim.b.neodev_enabled = library.enabled
        end,
    },},
    {'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason-lspconfig.nvim',
            cmd = { 'LspInstall', 'LspUninstall' },
        },},
    },
    {'jay-babu/mason-null-ls.nvim',
    dependencies = {
        'jose-elias-alvarez/null-ls.nvim',
        'nvim-lua/plenary.nvim',
    },
    cmd = { 'NullLsInstall', 'NullLsUninstall' },
    opts = { automatic_setup = true, handlers = {} },
    config = function()
        local null_ls_status, null_ls = pcall(require, 'null-ls')
        if not null_ls_status then
            return
        end
        null_ls.setup()
    end,
},
},
},
-- Configuring LSP
opts = function()
    -- LSP setup
    local lsp_status, lsp = pcall(require, 'lsp-zero')
    if not lsp_status then
        return
    end

    lsp.preset('recommended')
    lsp.ensure_installed({
        'tsserver',
        'eslint',
        'rust_analyzer',
        'clangd',
    })

    lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        if client.name == "eslint" then
            vim.cmd.LspStop('eslint')
            return
        end

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    end)

    lsp.setup()

    vim.diagnostic.config({
        virtual_text = true,
    })
end
}
