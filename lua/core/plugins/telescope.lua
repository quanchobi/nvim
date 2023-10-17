return {
    "nvim-telescope/telescope.nvim",
    opts = {
        extensions = {
            file_browser = {
                hijack_netrw = true
            }
        }
    },
    config = function(_, opts)
        local tele = require("telescope")
        tele.setup(opts)

        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
        vim.keymap.set('n', '<leader>lg', builtin.live_grep, { desc = "Live Grep" } )
        vim.keymap.set('n', '<leader>fB', builtin.buffers, { desc = "Find Buffers" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
        vim.keymap.set('n', '<leader>of', builtin.oldfiles, { desc = "Recent Files" })
        vim.keymap.set('n', '<leader>mp', builtin.man_pages, { desc = "Man Pages" })

        tele.load_extension("fzf")
        tele.load_extension("file_browser")
        vim.keymap.set('n', '<leader>fb', ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true, desc = "File Browser" } )
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
}
