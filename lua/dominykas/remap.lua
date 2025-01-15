local my_commands = require("dominykas.commands")

vim.g.mapleader = " "
vim.g.omni_sql_no_default_maps = 1
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- custom commands
vim.keymap.set("n", "<leader>jsq", function() my_commands.jsq() end)
vim.keymap.set("n", "<leader>jq", function() my_commands.jq() end)
