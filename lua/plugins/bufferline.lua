
--[[require("buftabline").setup {
	  tab_format = "#{b}#{f} ",
    buffer_id_index = false,
    icon_colors = true,
    start_hidden = false,
    auto_hide = false,
    disable_commands = false,
    go_to_maps = true,
    flags = {
        modified = " [+]",
        not_modifiable = " [-]",
        readonly = " [RO]",
    },
}
]]

local bufferline = require("bufferline")

bufferline.setup{
	options = {
		mode = "buffers",
		syle_preset = bufferline.style_preset.minimal,
		show_close_icon = false,
		show_buffer_close_icons = false,
		truncate_names = false,
		show_tab_indicators = false,
		enforce_regular_tabs = true,
		close_icon = '',
		separator_style = 'thin' ,--{'[',']'},
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separetor = true,
				padding = 1
			},
		},
		hover = {
			enabled = true,
			delay = 200,
			reveal = {'close'}
		},
		indicator = {
			style = "none"
		},
	},
}
