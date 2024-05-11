 vim.fn.sign_define("DiagnosticSignError",
{text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
{text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
{text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
{text = "󰌵", texthl = "DiagnosticSignHint"})

require("neo-tree").setup({

	icon = {
		folder_closed = "",
    folder_open = "",
    folder_empty = "󰜌",
    default = "*",
    highlight = "NeoTreeFileIcon"
  },
	 created = {
		enabled = true,
    required_width = 60, -- min width of window required to show this column
  },
	symlink_target = {
		enabled = true,
	},
	filesystem = {
		hide_dotfiles = true,
		hide_gitignored = true,
		hide_by_name = {
			"composer.lock",
		},
		always_show = {
			-- PHP
		 ".vendor",
		},
		never_show = {
			-- PHP
			"",
		},
	}
})

 -- Remap
vim.api.nvim_set_keymap('n', '<Space>e', ':Neotree toggle<CR>', {})
