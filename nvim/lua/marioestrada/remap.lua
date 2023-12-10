--
-- Mappings
--

-- Leader key
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Exec
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
