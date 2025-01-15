-- Indentation
vim.opt.autoindent = true   -- Enables auto indentation
vim.opt.softtabstop = 4     -- sets soft tab stop at 4
vim.opt.smartindent = true  -- Enables syntax based auto indentation
vim.opt.shiftwidth = 4      -- Sets indentation depth to 4 columns
vim.opt.tabstop = 4         -- Uses 4 spaces instead of 1 tab
vim.opt.expandtab = true    -- Use spaces instead of tabs

-- Wrap
vim.opt.wrap = false        -- Disables wrapping
vim.opt.sidescroll = 2      -- always shows at least 2 lines after where cursor is horizontally
vim.opt.sidescrolloff = 2   -- always show at least 2 lines before where cursor is horizontally

-- Search
vim.opt.hlsearch = true     -- Highlight search results
vim.opt.ignorecase = true   -- Perform case insensitive search
vim.opt.smartcase = true    -- Unless caps are used, then use case sensitive search
vim.opt.incsearch = true    -- Incrementally highlight matched characters
vim.opt.showmatch = true    -- Show matching words during a search

-- Undofile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.opt.undofile = true

-- Visuals
vim.opt.nu = true                   -- line number
vim.opt.rnu = true                  -- relative line number
vim.opt.cursorline = true           -- Highlight current line
vim.opt.cursorlineopt = 'number'    -- Highlight current linenumber
vim.opt.scrolloff = 8               -- Min lines at top and bottom is 8

-- Indentation based on filetype
vim.api.nvim_create_autocmd("FileType", {
    pattern = "nix",
    command = "setlocal shiftwidth=2 tabstop=2"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    command = "setlocal shiftwidth=2 tabstop=2"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "py",
    command = "setlocal shiftwidth=2 tabstop=2"
})

-- Automatically delete trailing whitespace on write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
