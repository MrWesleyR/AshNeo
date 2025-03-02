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
	popup_border_style = "rounded",
	 window = {
		 position = "float",
	 },
	created = {
		enabled = true,
    required_width = 601, -- min width of window required to show this column
  },
	symlink_target = { enabled = true, },
	source_selector = {
		winbar = true,
		content_layout = "center",
		sources = {
			{ source = "filesystem", display_name = " 󰈔 File" },
			{ source = "buffers", display_name = "  Bufs" },
			{ source = "git_status", display_name = "  Git" },
		},
	},
	filesystem = {
		hide_dotfiles = true,
		hide_gitignored = true,
		hide_by_name = {
			"composer.lock",
			 ".gitignore"
		},
		always_show = {
			-- PHP
		},
		never_show = {
			-- PHP
		 "vendor",
		 },
	},
})

-- Remap
vim.api.nvim_set_keymap('n', '<Space>e', ':Neotree toggle position=float action=focus<CR>', {})
