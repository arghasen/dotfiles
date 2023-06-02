require('nvim-tree').setup({
  hijack_cursor = false,
})

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
