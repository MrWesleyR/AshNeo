require('gitsigns').setup({
  signs = {
    add = {text = ' ▎'},
    change = {text = ' ▎'},
    delete = {text = ' ➤'},
    topdelete = {text = ' ➤'},
    changedelete = {text = ' ▎'},
  }
})

local api =  vim.api

api.nvim_set_keymap('n', 'gd', '<cmd>Gitsigns diffthis<cr>', {})
api.nvim_set_keymap('n', 'gc', '<cmd>Gitsigns show_commit<cr>', {})
