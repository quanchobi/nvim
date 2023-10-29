return {
	"rebelot/kanagawa.nvim",
    -- put options here, they will be passed into the config function below
    opts = {
        colors = {
            theme = {
                all = {
                    ui = {
                        bg_gutter = "none",
                    }
                }
            }
        }
    },
    -- takes the options from above and sets them
	config = function(_, opts)
        -- protected call for error handling
        local kana = require("kanagawa")
        kana.setup({
            colors = opts.colors,
            -- Overrides to make popup menus more consistent
            overrides = function(colors)
                local theme = colors.theme
                return {
                    Pmenu = { fg = theme.ui.shade0, bg = "NONE" },
                    PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2, bold = true },
                    PmenuSbar = { bg = "NONE" },
                    PmenuThumb = { bg = "NONE" },
                }
            end,
        })

        -- loading the colorscheme
		vim.cmd("colorscheme kanagawa-wave")
	end,
}
