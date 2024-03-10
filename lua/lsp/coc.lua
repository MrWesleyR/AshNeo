local keyset = vim.keymap.set

--Autocomplete 
function _G.check_back_space()
	local col = vim.fn.col('.') -1
	return  col == 0 or vim.fn.getline('.'):sub(col,col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

vim.g.coc_global_extensions = {
	'coc-phpls', 'coc-tsserver', 'coc-html', 'coc-css',
	'coc-eslint', 'coc-emmet', 'coc-prettier', 'coc-json',
	'coc-htmlhint', 'coc-stylua', 'coc-lua', 'coc-cmake', 'coc-clangd'
}

keyset(
	"i",
	"<TAB>",
	'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
	opts
)

keyset(
	"i",
	"<ENTER>",
	"coc#pum#visible() ? coc#pum#confirm() : '<CR>'",
	{expr = true}
)

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
