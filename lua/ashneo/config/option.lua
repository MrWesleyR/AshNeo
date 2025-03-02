
vim.g.mapleader = " "

local options = vim.opt

options.termguicolors = true
options.swapfile = false
options.number = true
options.tabstop = 2
options.smarttab = true
options.smartindent = true
options.syntax = "on"
options.wrap = false
options.nu = true
options.backup = false
options.shiftwidth = 2
options.softtabstop = 2
options.cursorline = true
options.relativenumber = true
options.cursorlineopt = "number"
options.autoindent = true
options.backup = false
options.writebackup = false
options.signcolumn = "yes"
options.scrolloff=999
options.encoding = "utf-8"
options.fileencoding = "utf-8"
options.ignorecase = true

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

