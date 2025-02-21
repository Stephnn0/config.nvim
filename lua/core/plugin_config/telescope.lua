local builtin = require("telescope.builtin")

-- control + p
vim.keymap.set("n", "<c-p>", builtin.find_files, {})

-- control + f
vim.keymap.set("n", "<c-f>", builtin.git_files, {})
vim.keymap.set("n", "<Space><Space>", builtin.live_grep, {})
vim.keymap.set("n", "<Space>fg", builtin.buffers, {})
vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})

vim.keymap.set("n", "<Space>g", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
