vim.o.number = true
vim.o.relativenumber = true
vim.opt.termguicolors = true
vim.cmd.colorscheme = "catppucchin"

vim.opt.clipboard = "unnamedplus"

-- Comment selected lines
vim.api.nvim_set_keymap("v", "cl", ":s/^/\\/\\/ /<CR>", { noremap = true, silent = true })
-- Uncomment selected lines
vim.api.nvim_set_keymap("v", "ul", ":s/\\/\\/ //<CR>", { noremap = true, silent = true })

-- Autopair for curly braces
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", '"', '""<Left>')
vim.keymap.set("i", "'", "''<Left>")
