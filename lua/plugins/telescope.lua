local api =  vim.api

api.nvim_set_keymap('n','tf','<cmd>Telescope find_files<cr>',{})
api.nvim_set_keymap('n','tg','<cmd>Telescope live_grep<cr>',{})
api.nvim_set_keymap('n','tb','<cmd>Telescope buffers<cr>',{})
api.nvim_set_keymap('n','th','<cmd>Telescope help_tags<cr>',{})
api.nvim_set_keymap('n','tw','<cmd>Telescope grep_string<cr>',{})
api.nvim_set_keymap('n','fs','<cmd>Telescope current_buffer_fuzzy_find<cr>',{})

