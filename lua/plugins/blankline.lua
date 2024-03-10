require("ibl").setup({
	enabled = true,
	debounce = 100,
	indent = { char = "┊" },
	whitespace = { highlight = { "Whitespace", "NonText"} },
	exclude = {
		buftypes = { "terminal",'dashboard' },
		filetypes = { 'dashboard' }
	}
})
