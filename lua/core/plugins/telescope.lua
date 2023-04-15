return {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-lua/popup.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    },
    config = function()
        local telescope_status, telescope = pcall(require, 'telescope')
        if not telescope_status then
            return
        end

        local builtin = require('telescope.builtin')
        --local extensions = require('telescope.extensions')

        -- Extensions
        telescope.load_extension('fzf')

        -- Keybindings
        -- <leader>ff to find files in cwd
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})

        -- <leader>fg to find git files
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = "Find Git Files"})

        -- <leader>gl to live grep search current file
        vim.keymap.set('n', '<leader>fl', builtin.live_grep, {desc = "Live Grep in Files in CWD"})

    end
}
