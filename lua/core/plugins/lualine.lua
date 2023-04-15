return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'kyazdani42/nvim-web-devicons'
    },
    config = function()
        local lualine_status, lualine = pcall(require, 'lualine')
        if not lualine_status then
            return
        end
        local seoul256_custom = require('lualine.themes.seoul256')
        seoul256_custom.normal.c.bg = '#262626'

        lualine.setup {
            options = {
                icons_enabled = true,
                theme = 'seoul256',
                --section_separators = { left = '', right = '' },
                --component_separators = { left = '', right = '' },
                
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
        }
    end
}
