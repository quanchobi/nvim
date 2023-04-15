return {
    'rebelot/kanagawa.nvim',
    opts = function()
        kana_status, kana = pcall(require, 'kanagawa')
        if not kana_status then
            return
        end
        kana.setup({
            transparent = true,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = 'none',
                        }
                    }
                }
            }
        })
        vim.cmd("colorscheme kanagawa-wave")
    end
}
