return {
    "jackMort/ChatGPT.nvim",
    opts = {
        api_key_cmd = "pass show ChatGPT/API-KEY" -- Modify this line as you see fit. See the ChatGPT.nvim github page for more info.
    },
    -- Keybindings that load the plugin
    keys = {
        { "<leader>cp", "<cmd>ChatGPT<CR>", desc = "Prompt ChatGPT", mode = { "n", "v" } },
        { "<leader>cc", "<cmd>ChatGPTCompleteCode<CR>", desc = "ChatGPT Code Completion", mode = { "n", "v" } },
        { "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "ChatGPT Edit with Instructions", mode = { "n", "v" } },
        { "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "ChatGPT Grammar Correction", mode = { "n", "v" } },
        { "<leader>ct", "<cmd>ChatGPTRun translate<CR>", desc = "ChatGPT Translate", mode = { "n", "v" } },
        { "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "ChatGPT Explain Code", mode = { "n", "v" } },
        { "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", desc = "ChatGPT Add Tests", mode = { "n", "v" } },
        { "<leader>ct", "<cmd>ChatGPTRun add_tests<CR>", desc = "ChatGPT Add Tests", mode = { "n", "v" } },
        { "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "ChatGPT Fix Bugs", mode = { "n", "v" } },
        { "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "ChatGPT Optimize Code", mode = { "n", "v" } },
        { "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", desc = "ChatGPT Summarize", mode = { "n", "v" } },
        { "<leader>cs", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "ChatGPT Summarize", mode = { "n", "v" } },
    },
    -- Plugins that ChatGPT.nvim rely on
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    }
}
