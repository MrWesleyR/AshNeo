#!/bin/bash

# Verifica se o Neovim está instalado
if ! command -v nvim &> /dev/null; then
    echo "Neovim não encontrado. Por favor, instale o Neovim antes de executar este script."
    exit 1
fi

# Diretório onde será criado o arquivo de configuração
CONFIG_DIR="$HOME/.config/nvim"
CONFIG_FILE="$CONFIG_DIR/init.vim"

rm -rf $CONFIG_FILE
rm -rf $CONFIG_DIR

# Cria o diretório de configuração se não existir
mkdir -p $CONFIG_DIR

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
echo "set tabstop=4" >> $CONFIG_FILE
echo "set shiftwidth=4" >> $CONFIG_FILE
echo "set expandtab" >> $CONFIG_FILE
echo "syntax on" >> $CONFIG_FILE
echo "set noswapfile" >> $CONFIG_FILE
echo "let g:airline#extensions#tabline#enabled = 1" >> $CONFIG_FILE
echo "let g:airline#extensions#tabline#left_sep = ' '" >> $CONFIG_FILE
echo "let g:airline#extensions#tabline#left_alt_sep = '>'" >> $CONFIG_FILE
echo "let g:airline#extensions#hunks#enabled=0" >> $CONFIG_FILE
# Adiciona as configurações do NERDTree
echo "nnoremap <Space>e :NERDTreeToggle<CR>" >> $CONFIG_FILE

# Configuração do Language Server Protocol (LSP) com coc.nvim
echo "call plug#begin('~/.vim/plugged')" >> $CONFIG_FILE

echo "Plug 'neoclide/coc.nvim', {'branch': 'release'}" >> $CONFIG_FILE # LSP INSTALLER
echo "Plug 'preservim/nerdtree'" >> $CONFIG_FILE #TREE FILES 
echo "Plug 'wakatime/vim-wakatime'" >> $CONFIG_FILE # PRODUCT VIEW
echo "Plug 'rebelot/kanagawa.nvim'" >> $CONFIG_FILE #THEME
echo "Plug 'lewis6991/gitsigns.nvim'" >> $CONFIG_FILE #OPTIONAL: for git statu
echo "Plug 'vim-airline/vim-airline'" >>$CONFIG_FILE #Bar
echo "Plug 'vim-airline/vim-airline-themes'" >> $CONFIG_FILE #Bar themes
echo " call plug#end()" >> $CONFIG_FILE
# LPS install 
echo "let g:coc_global_extensions = ['coc-phpls', 'coc-tsserver', 'coc-html', 'coc-css']" >> $CONFIG_FILE

# Adiciona o tema padrão
echo "autocmd VimEnter * colorscheme kanagawa" >> $CONFIG_FILE
echo "let g:airline_theme = 'base16'" >> $CONFIG_FILE

# Configurações de autocompletar para linguagens específicas
echo "autocmd FileType javascript setlocal omnifunc=coc#refresh()" >> $CONFIG_FILE
echo "autocmd FileType typescript setlocal omnifunc=coc#refresh()" >> $CONFIG_FILE
echo "autocmd FileType php setlocal omnifunc=coc#refresh()" >> $CONFIG_FILE
echo "autocmd FileType html setlocal omnifunc=coc#refresh()" >> $CONFIG_FILE
echo "autocmd FileType css setlocal omnifunc=coc#refresh()" >> $CONFIG_FILE

# Mapeamento de tecla para ativar o autocompletar e pegar a seleção
echo "inoremap <expr> pumvisible() ? (complete_info().selected != -1 ? '\<C-y>' ) : coc#refresh()" >> $CONFIG_FILE
echo "inoremap <expr> pumvisible() ? '<C-n>' : coc#refresh()" >> $CONFIG_FILE


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

echo "Configuração do Neovim concluída!"
