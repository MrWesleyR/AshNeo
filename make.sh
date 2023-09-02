#!/usr/bin/env bash

installDeps() 
{
	dpkg -s $1 &> /dev/null  

	if [ $? -ne 0 ]
		then  
			sudo pacman -Syu
			sudo pacman -S $1
	fi
}

# Verifica se o Neovim está instalado
if ! command -v nvim &> /dev/null; then
  echo "Neovim não encontrado. Por favor, instale o Neovim antes de executar este script."
  exit 1
fi

# Diretório onde será criado o arquivo de configuração
CONFIG_DIR="$HOME/.config/nvim"
CONFIG_NVIM="$HOME/.vim"

rm -rf $CONFIG_DIR
rm -rf $CONFIG_NVIM

# Cria o diretório de configuração se não existir
mkdir -p $CONFIG_DIR

# Cria o arquivo de configuração se não existir
if [ ! -f $CONFIG_DIR"/init.vim" ]; then
	cp -R "./source/init.vim" "$CONFIG_DIR"
fi

# Instala o gerenciador de pacotes 'vim-plug' se ainda não estiver instalado
PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
PLUG_FILE="$CONFIG_DIR/autoload/plug.vim"

if [ ! -f $PLUG_FILE ]; then
  echo "Instalando 'vim-plug'..."
  curl -fLo $PLUG_FILE --create-dirs $PLUG_URL
fi

#Instala as Dependências
installDeps 'git'
installDeps 'npm'

# Instala os plugins configurados
echo "Instalando plugins..."
nvim -u $CONFIG_DIR"/init.vim" +PlugInstall +qall

echo "Configuração do Neovim concluída!"
echo "Abrindo seu novo neovim"

sleep 2s

nvim 

