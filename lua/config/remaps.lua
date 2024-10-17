local api = vim.api
-- Global vim

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

api.nvim_set_keymap('n', 'q', ':bd<CR>', {})
api.nvim_set_keymap('n', 'Q', ':q<CR>', {})
api.nvim_set_keymap('n', '<C-d>', ':bnext<CR>', {})
api.nvim_set_keymap('n', '<C-a>', ':bprevious<CR>', {})
api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {})
api.nvim_set_keymap('n', '<C-x>', ':x<CR>', {})
api.nvim_set_keymap('n', 'ss', ':split<CR>', {})
api.nvim_set_keymap('n', 'sv', ':vsplit<CR>', {})
api.nvim_set_keymap('n', '<C-h>', ':vertical resize -5<CR>', {})
api.nvim_set_keymap('n', '<C-l>', ':vertical resize +5<CR>', {})
api.nvim_set_keymap('n', '<C-k>', ':resize -5<CR>', {})
api.nvim_set_keymap('n', '<C-j>', ':resize +5<CR>', {})
api.nvim_set_keymap('n', '<tb>', ':Telescope buffers<CR>', {})
api.nvim_set_keymap('n', '<lz>', ':Telescope buffers<CR>', {})
