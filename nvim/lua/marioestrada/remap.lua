local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader><leader>", function()
    vim.cmd("so")
end)
