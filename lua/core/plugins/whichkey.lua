return {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        local wk_status, wk = pcall(require, "which-key")
        wk.setup({
        })
    end,
}
