-- Dashboard 
require('dashboard').setup {
	theme='hyper',
  config = {
		header = {
			"",
			"",
			" ▄▄▄        ██████  ██░ ██  ██▓ ██▀███   ▄▄▄       ██ ▄█▀",
			"▒████▄    ▒██    ▒ ▓██░ ██▒▓██▒▓██ ▒ ██▒▒████▄     ██▄█▒ ",
			"▒██  ▀█▄  ░ ▓██▄   ▒██▀▀██░▒██▒▓██ ░▄█ ▒▒██  ▀█▄  ▓███▄░ ",
			"░██▄▄▄▄██   ▒   ██▒░▓█ ░██ ░██░▒██▀▀█▄  ░██▄▄▄▄██ ▓██ █▄ ",
			" ▓█   ▓██▒▒██████▒▒░▓█▒░██▓░██░░██▓ ▒██▒ ▓█   ▓██▒▒██▒ █▄",
			" ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░▓  ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░▒ ▒▒ ▓▒",
			"     ▒   ▒▒ ░░ ░▒  ░ ░ ▒ ░▒░ ░ ▒ ░  ░▒ ░ ▒░  ▒   ▒▒ ░░ ░▒ ▒░",
			"  ░   ▒   ░  ░  ░   ░  ░░ ░ ▒ ░  ░░   ░   ░   ▒   ░ ░░ ░ ",
			"      ░  ░      ░   ░  ░  ░ ░     ░           ░  ░░  ░   ",
			"",
			"",
    },
    shortcut = {
			{ desc = '󰊳 Update', group = '@property', action = 'PackerSync', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
    },
    packages = { enable = false },
    project = { enable = true, limit = 8, icon = '', label = ' Projetos:', action = function (path) vim.cmd('e ' .. path) end },
		mru = { enable = false },
    footer = { "", "", 'De o seu melhor hoje e amanha!'}
	},
	hide = { statusline, tabline, winbar },
}

--  ######## Remaps ########
vim.api.nvim_set_keymap('n',"D",":Dashboard<CR>",{})
