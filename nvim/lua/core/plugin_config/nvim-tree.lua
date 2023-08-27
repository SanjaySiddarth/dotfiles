vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_auto_close = 1

require("nvim-tree").setup()


vim.keymap.set('n', '<c-b>', ':NvimTreeFindFileToggle<CR>')
