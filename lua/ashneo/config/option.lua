vim.g.mapleader = " "

-- Global options
local opt = vim.opt

-- UI
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 999

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true

-- Files and encoding
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Searching
opt.ignorecase = true
opt.smartcase = true

-- Responsiveness
opt.updatetime = 300
opt.timeoutlen = 500

-- Render
opt.winblend = 0
opt.pumblend = 0

-- Syntax (modern Neovim ignores this; consider Treesitter instead)
vim.cmd("syntax on")

-- Format options: add asterisks in block comments
opt.formatoptions:append({ "r" })

-- Undercurl support in terminal (use with caution or terminal compatibility)
-- Works best with Neovim 0.8+ in truecolor terminals
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Disable health checks (not recommended unless you really want it)
vim.g.health_disable = true


