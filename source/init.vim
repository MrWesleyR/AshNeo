" -- Globals

set number
set wrap
set smartindent
set tabstop=2
syntax on
diffoff
set autowriteall
set noswapfile
set nobackup 
set autoindent
set  softtabstop=2 shiftwidth=2

" ############## Airline ################ 

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['hunks', 'branch', 'tabline']
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b' ],
      \ [ 'x', 'z', 'error', 'warning' ]
      \ ]
let g:airline_section_y = '80'
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_z = '%2l/%L:%2v'

"########### Markdown ################

let g:tex_conceal = ''
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']

"############### GitGutter #####################

highlight GitGutterAdd guifg=#009900 ctermfg=2 
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_set_sign_backgrounds = 0
let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|' 
let g:gitgutter_sign_removed = '|'

"############## BlankLine ################

let g:indentLine_bufTypeExclude = [ 'dashboard' ]
let g:max_indent_increase = 1
let g:indent_blankline_filetype = ['markdown', 'php', 'js', 'javascript', 'C', 'c', 'C', 'c++' ]

"############## NerdTreee ################

let g:NERDTreeGitStatusUseNerdFonts = 1 

" ################# LSP ##################
call plug#begin('~/.vim/plugged')
 
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'wakatime/vim-wakatime'
    Plug 'olivercederborg/poimandres.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'ap/vim-css-color'
    Plug 'plasticboy/vim-markdown'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'caenrique/nvim-toggle-terminal'
    Plug 'glepnir/dashboard-nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()


" ################# Key Mapping ##################

" -- Global 
nnoremap <Space>e :NERDTreeToggle<CR>
nnoremap <F4> :bd<CR>
nnoremap <silent>q :q <CR>
nnoremap <C-Right> :bnext <CR>
nnoremap <C-Left> :bprevious <CR>
nnoremap <C-s> :w <CR>

" -- ToggleTerminal 
nnoremap <silent> <C-t> :ToggleTerminal<Enter>
tnoremap <silent> <C-t> <C-\><C-n>:ToggleTerminal<Enter>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" -- CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <C-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" -- Telescope

" Find files using Telescope command-line sugar.
nnoremap <silent>tf <cmd>Telescope find_files<cr>
nnoremap <silent>tg <cmd>Telescope live_grep<cr>
nnoremap <silent>tb <cmd>Telescope buffers<cr>
nnoremap <silent>th <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <silent>tf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent>tg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent>tb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <silent>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" -- Dashboard 

nnoremap <silent>D :Dashboard<CR>

" ################## LSP ########################

let g:coc_global_extensions = ['coc-phpls', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-eslint', 'coc-emmet', 'coc-prettier', 'coc-json', 'coc-htmlhint', 'coc-stylua', 'coc-lua', 'coc-cmake', 'coc-clangd']

"################### Theme ###################

autocmd VimEnter * colorscheme catppuccin-mocha 
let g:airline_theme = 'base16_black_metal_immortal'

"############## Auto commands ####################
autocmd FileType javascript setlocal omnifunc=coc#refresh()
autocmd FileType typescript setlocal omnifunc=coc#refresh()
autocmd FileType php setlocal omnifunc=coc#refresh()
autocmd FileType html setlocal omnifunc=coc#refresh()
autocmd FileType css setlocal omnifunc=coc#refresh()
autocmd FileType json setlocal omnifunc=coc#refresh()
autocmd FileType clang setlocal omnifunc=coc#refresh() 

lua << EOF

-- Themes 
require("catppuccin").setup({
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            notify = true,
            mini = false,
        },
    })
local mocha = require("catppuccin.palettes").get_palette "mocha"

-- Dashboard 
require('dashboard').setup {
      theme='hyper',
      config = {
         header = {
            \"",
            \"",
            \" ▄▄▄        ██████  ██░ ██  ██▓ ██▀███   ▄▄▄       ██ ▄█▀",
            \"▒████▄    ▒██    ▒ ▓██░ ██▒▓██▒▓██ ▒ ██▒▒████▄     ██▄█▒ ",
            \"▒██  ▀█▄  ░ ▓██▄   ▒██▀▀██░▒██▒▓██ ░▄█ ▒▒██  ▀█▄  ▓███▄░ ",
            \"░██▄▄▄▄██   ▒   ██▒░▓█ ░██ ░██░▒██▀▀█▄  ░██▄▄▄▄██ ▓██ █▄ ",
            \" ▓█   ▓██▒▒██████▒▒░▓█▒░██▓░██░░██▓ ▒██▒ ▓█   ▓██▒▒██▒ █▄",
            \" ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░▓  ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░▒ ▒▒ ▓▒",
            \"     ▒   ▒▒ ░░ ░▒  ░ ░ ▒ ░▒░ ░ ▒ ░  ░▒ ░ ▒░  ▒   ▒▒ ░░ ░▒ ▒░",
            \"  ░   ▒   ░  ░  ░   ░  ░░ ░ ▒ ░  ░░   ░   ░   ▒   ░ ░░ ░ ",
            \"      ░  ░      ░   ░  ░  ░ ░     ░           ░  ░░  ░   ",
            \"",
            \"",
        },
        shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'PlugUpdate', key = 'u' },
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
        project = { enable = false, limit = 8, icon = '', label = ' Projetos:', action = 'Telescope find_files cwd=' },
        footer = {
							\"",
							\"",
							'De o seu melhor hoje e amanha!'} 
      },
      hide = {
        statusline, 
        tabline,      
        winbar,        
    },
}

-- Treesitter 
require'nvim-treesitter.configs'.setup {
	ensure_installed={'c','lua', 'vim', 'vimdoc', 'query', 'php', 'json', 'javascript', 'typescript', 'gitcommit', 'html', 'css'},
    sync_install=false,
    auto_install=true,
    indent = {
       enable = true
    },
    highlight={
        enable=true,
        disable={'c'},
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    }
}

