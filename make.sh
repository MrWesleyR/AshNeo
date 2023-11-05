#!/usr/bin/env bash

installDeps() 
{
	dpkg -s $1 &> /dev/null  

	if [ $? -ne 0 ]
		then  
			sudo pacman -S $1
	fi
}

# Verifica se o Neovim está instalado
if ! command -v nvim &> /dev/null; then
  echo -e " \n [ ERRO ] Neovim não encontrado!! \n === Instalando neovim === \n"
	
	installDeps "neovim"
  exit 1
fi

# Diretório onde será criado o arquivo de configuração
CONFIG_DIR="$HOME/.config/nvim"
CONFIG_NVIM="$HOME/.vim"
AIRBLADE="$HOME/.config/nvim/pack/airblade/start"
FURGITIVE="$HOME/.config/nvim/pack/tpope/start"

rm -rf $AIRBLADE
rm -rf $FURGITIVE
rm -rf $CONFIG_DIR
rm -rf $CONFIG_NVIM

# Cria o diretório de configuração se não existir
mkdir -p $CONFIG_DIR
mkdir -p $FURGITIVE
mkdir -p $AIRBLADE

# Cria o arquivo de configuração se não existir
if [ ! -f $CONFIG_DIR"/init.vim" ]; then
	cp -R "./source/init.vim" "$CONFIG_DIR"
fi

# Instala o gerenciador de pacotes 'vim-plug' se ainda não estiver instalado
PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
PLUG_FILE="$CONFIG_DIR/autoload/plug.vim"

if ! [ -f $PLUG_FILE ]; then
  echo -e "\n Instalando vim-plug === \n"
	curl -fLo $PLUG_FILE --create-dirs $PLUG_URL
fi

echo -e "\n === Atualizar sistema === \n"
sudo pacman -Syu

#Instala as Dependências
installDeps 'git'
installDeps 'npm'

echo -e "\n === Instalando mais plugins === \n"
#Instala Airline

cd $AIRBLADE
git clone https://github.com/airblade/vim-gitgutter.git
nvim -u NONE -c "helptags vim-gitgutter/doc" -c q

#Instala Furgive
cd $FURGITIVE
git clone https://tpope.io/vim/fugitive.git
nvim -u NONE -c "helptags fugitive/doc" -c q

# Instala os plugins configurados
echo -e "\n === Instalando plugins == \n"
nvim -u $CONFIG_DIR"/init.vim" +PlugInstall +qall

echo -e "\n -> Configuração do Neovim concluída! <-"
echo -e "\n -> Abrindo seu novo neovim <-"

sleep 2s

nvim 
