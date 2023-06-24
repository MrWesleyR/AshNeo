#!/bin/bash

# Verifica se o Neovim está instalado
if ! command -v nvim &> /dev/null; then
    echo "Neovim não encontrado. Por favor, instale o Neovim antes de executar este script."
    exit 1
fi

# Diretório onde será criado o arquivo de configuração
CONFIG_DIR="$HOME/.config/nvim"
CONFIG_FILE="$CONFIG_DIR/init.vim"
AIRBLADE="$HOME/.config/nvim/pack/airblade/start"
FURGITIVE="$HOME/.config/nvim/pack/tpope/start"

rm -rf $CONFIG_FILE
rm -rf $CONFIG_DIR
rm -rf $AIRBLADE
rm -rf $FURGITIVE

# Cria o diretório de configuração se não existir
mkdir -p $CONFIG_DIR
mkdir -p $AIRBLADE

# Cria o arquivo de configuração se não existir
if [ ! -f $CONFIG_FILE ]; then
    touch $CONFIG_FILE
fi

# Limpa o arquivo de configuração
> $CONFIG_FILE

# Adiciona as configurações básicas do Neovim
echo "set number" >> $CONFIG_FILE
echo "set wrap" >> $CONFIG_FILE
echo "set smartindent" >> $CONFIG_FILE
echo "set tabstop=3" >> $CONFIG_FILE
echo "set shiftwidth=4" >> $CONFIG_FILE
echo "set expandtab" >> $CONFIG_FILE
echo "syntax on" >> $CONFIG_FILE
echo "diffoff" >> $CONFIG_FILE
echo "set noswapfile" >> $CONFIG_FILE

#NerdTree
echo "let g:NERDTreeGitStatusUseNerdFonts = 1 " >> $CONFIG_FILE

#Airline
echo "let g:airline#extensions#tabline#enabled = 1" >> $CONFIG_FILE
echo "let g:airline#extensions#hunks#enabled=1" >> $CONFIG_FILE
echo "let g:airline#extensions#tabline#formatter = 'unique_tail'">> $CONFIG_FILE
echo "let g:airline_powerline_fonts = 1" >> $CONFIG_FILE
echo "let g:airline_extensions = ['hunks', 'branch', 'tabline']" >> $CONFIG_FILE
echo "let g:airline#extensions#coc#enabled = 1" >> $CONFIG_FILE
echo " let g:airline#extensions#default#layout = [
      \ [ 'a', 'b' ],
      \ [ 'x', 'z', 'error', 'warning' ]
      \ ]" >> $CONFIG_FILE
echo "let g:airline_section_y = '80'" >> $CONFIG_FILE
echo "let g:airline#extensions#wordcount#enabled = 0" >> $CONFIG_FILE
echo "let g:airline_section_z = '%2l/%L:%2v'" >> $CONFIG_FILE

#Desativar recurso de ocultação de texto matemático
echo "let g:tex_conceal = ''" >> $CONFIG_FILE
echo "let g:vim_markdown_math = 1" >> $CONFIG_FILE

#Markdown
echo "let g:vim_markdown_folding_disabled = 1" >> $CONFIG_FILE
echo "let g:vim_markdown_frontmatter = 1" >> $CONFIG_FILE
echo "let g:vim_markdown_conceal = 0" >> $CONFIG_FILE
echo "let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']" >> $CONFIG_FILE

#GitGuntter
echo "highlight GitGutterAdd guifg=#009900 ctermfg=2 ">> $CONFIG_FILE
echo "highlight GitGutterChange guifg=#bbbb00 ctermfg=3" >> $CONFIG_FILE
echo "highlight GitGutterDelete guifg=#ff2222 ctermfg=1" >> $CONFIG_FILE
echo "let g:gitgutter_set_sign_backgrounds = 0" >> $CONFIG_FILE
echo "let g:gitgutter_sign_added = '|'" >> $CONFIG_FILE
echo "let g:gitgutter_sign_modified = '|' " >> $CONFIG_FILE
echo "let g:gitgutter_sign_removed = '|'" >> $CONFIG_FILE
#echo "let g:gitgutter_sign_removed_first_line = '^^' " >> $CONFIG_FILE

# Adiciona as configurações do NERDTree
echo "nnoremap <Space>e :NERDTreeToggle<CR>" >> $CONFIG_FILE

#Hunks
echo "nnoremap <F4> :bd<CR>" >> $CONFIG_FILE
echo "nnoremap <C-m> :bnext <CR>" >> $CONFIG_FILE
echo "nnoremap <C-n> :bprevious <CR>" >> $CONFIG_FILE

#Plugins
echo "call plug#begin('~/.vim/plugged')" >> $CONFIG_FILE

echo "Plug 'neoclide/coc.nvim', {'branch': 'release'}" >> $CONFIG_FILE # LSP INSTALLER
echo "Plug 'preservim/nerdtree'" >> $CONFIG_FILE #TREE FILES 
echo "Plug 'Xuyuanp/nerdtree-git-plugin'" >> $CONFIG_FILE
echo "Plug 'wakatime/vim-wakatime'" >> $CONFIG_FILE # PRODUCT VIEW
echo "Plug 'olivercederborg/poimandres.nvim'" >> $CONFIG_FILE #THEME
echo "Plug 'lewis6991/gitsigns.nvim'" >> $CONFIG_FILE #OPTIONAL: for git status
echo "Plug 'ap/vim-css-color'" >> $CONFIG_FILE 
echo "Plug 'plasticboy/vim-markdown'" >> $CONFIG_FILE
echo "Plug 'vim-airline/vim-airline'" >>$CONFIG_FILE #Bar
echo "Plug 'vim-airline/vim-airline-themes'" >> $CONFIG_FILE #Bar themes
echo "Plug 'caenrique/nvim-toggle-terminal'" >> $CONFIG_FILE
echo "call plug#end()" >> $CONFIG_FILE

#ToggleTerm
echo "nnoremap <silent> <C-t> :ToggleTerminal<Enter>
tnoremap <silent> <C-t> <C-\><C-n>:ToggleTerminal<Enter>" >> $CONFIG_FILE
echo 'tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"' >> $CONFIG_FILE
echo 'set autowriteall' >> $CONFIG_FILE

# LPS install 
echo "let g:coc_global_extensions = ['coc-phpls', 'coc-tsserver', 'coc-html', 'coc-css','coc-eslint', 'coc-emmet', 'coc-prettier']" >> $CONFIG_FILE

# Adiciona o tema padrão
echo "autocmd VimEnter * colorscheme poimandres" >> $CONFIG_FILE
echo "let g:airline_theme = 'base16_black_metal_immortal'" >> $CONFIG_FILE

# Configurações de autocompletar para linguagens específicas
echo "autocmd FileType javascript setlocal omnifunc=coc#refresh()" >> $CONFIG_FILE
echo "autocmd FileType typescript setlocal omnifunc=coc#refresh()" >> $CONFIG_FILE
echo "autocmd FileType php setlocal omnifunc=coc#refresh()" >> $CONFIG_FILE
echo "autocmd FileType html setlocal omnifunc=coc#refresh()" >> $CONFIG_FILE
echo "autocmd FileType css setlocal omnifunc=coc#refresh()" >> $CONFIG_FILE

# Mapeamento de tecla para ativar o autocompletar e pegar a seleção
echo "inoremap <expr> pumvisible() ? (complete_info().selected != -1 ? '\<CR>' ) : coc#refresh()" >> $CONFIG_FILE

# Instala o gerenciador de pacotes 'vim-plug' se ainda não estiver instalado
PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
PLUG_FILE="$CONFIG_DIR/autoload/plug.vim"

if [ ! -f $PLUG_FILE ]; then
    echo "Instalando 'vim-plug'..."
    curl -fLo $PLUG_FILE --create-dirs $PLUG_URL
fi

# Instala os plugins configurados
echo "Instalando plugins..."
nvim -u $CONFIG_FILE +PlugInstall +qall

#Instala Airline
cd $AIRBLADE
git clone https://github.com/airblade/vim-gitgutter.git
nvim -u NONE -c "helptags vim-gitgutter/doc" -c q

#Instala Furgive
cd $FURGITIVE
git clone https://tpope.io/vim/fugitive.git
nvim -u NONE -c "helptags fugitive/doc" -c q

lua << EOF
  require('poimandres').setup {
    " leave this setup function empty for default config
    " or refer to the configuration section
    " for configuration options
  }
EOF

echo "Configuração do Neovim concluída!"
echo "Abrindo seu novo neovim"

cd $HOME

sleep 2s

nvim 
