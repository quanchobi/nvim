return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    dependencies = {
        'nvim-treesitter/playground',
    },
    config = function()
        local treesitter_status, treesitter = pcall(require, 'nvim-treesitter.configs')
        if not treesitter_status then
            return
        end

        treesitter.setup {
            ensure_installed = {
                'python',
                'comment',
                'lua',
                'cpp',
                'c',
                'fish',
                'rust',
            },
            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}
