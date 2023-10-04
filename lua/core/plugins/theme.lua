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
        local theme = require("kanagawa")
        theme.setup(opts)

        -- loading the colorscheme
		vim.cmd("colorscheme kanagawa-wave")
	end
}
