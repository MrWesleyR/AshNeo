local api = vim.api

-- Global vim
api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', {})
api.nvim_set_keymap('n', 'q', ':bd<CR>', {})
api.nvim_set_keymap('n', 'Q', ':q<CR>', {})
api.nvim_set_keymap('n', '<C-d>', ':bnext<CR>', {})
api.nvim_set_keymap('n', '<C-a>', ':bprevious<CR>', {})
api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {})
api.nvim_set_keymap('n', '<C-x>', ':x<CR>', {})
api.nvim_set_keymap('n', 'ss', ':split<CR>', {})
api.nvim_set_keymap('n', 'sv', ':vsplit<CR>', {})
api.nvim_set_keymap('n', '<Left>', ':vertical resize -5<CR>', {})
api.nvim_set_keymap('n', '<Right>', ':vertical resize +5<CR>', {})
api.nvim_set_keymap('n', '<Up>', ':resize -5<CR>', {})
api.nvim_set_keymap('n', '<Button>', ':resize +5<CR>', {})
