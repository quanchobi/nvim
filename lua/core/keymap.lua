-- Vanilla vim keybindings, any plugin specific bindings will be in their plugin configuration files.

-- Disabling mouse
vim.opt.mouse = ""
-- Setting leader key to space
vim.g.mapleader = " "

-- Move highlighted text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Allows cursor to remain in place when appending
vim.keymap.set("n", "J", "mzJ`z")

-- Keeps cursor in the middle when using C-d and C-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keeps cursor in the middle of the screen when searching for text
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Deletes highlighted word into void register when pasting over it when <leader>p is pressed instead of p to paste
vim.keymap.set("x", "<leader>p", "\"_dP")

-- <leader>y copies to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = "Copies Selection into System Clipboard"})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = "Copies Line into System Clipboard"})

-- <leader>d deletes to void register
vim.keymap.set({"n", "v"}, "<leader>dd", [["_d]], {desc = "Delete into Void Register"})

-- <leader>s replaces current word with whatever is typed in the menu
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Replace Current Word"})
