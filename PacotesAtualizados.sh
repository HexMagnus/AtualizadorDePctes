#!/bin/bash

# Verifica se o usuário é root ou tem permissões de sudo
if ! [[ $(id -u) = 0 ]]; then
   zenity --error --text="Este script precisa ser executado com permissões de root ou sudo."
   exit 1
fi

# Atualiza a lista de pacotes disponíveis
(
    apt-get update -q -y &&
    echo "10" &&
    apt-get upgrade -q -y >/dev/null 2>&1 &&
    echo "60" &&
    apt-get autoclean -q -y &&
    apt-get autoremove -q -y >/dev/null 2>&1 &&
    echo "100"
) | zenity --progress --title="Atualizando pacotes" --text="Atualizando pacotes, aguarde..." --auto-close --percentage=0

zenity --info --text="O sistema foi atualizado com sucesso."

