#!/bin/bash

###################################################################################################
#                                                                                                 #
# SCRIPT FILE: install_terraform.sh                                                               #
# CREATION DATE: 08/11/2022                                                                       #
# HOUR: 09:25                                                                                     #
# DISTRIBUTION USED: UBUNTU                                                                       #
# OPERATIONAL SYSTEM: DEBIAN                                                                      #
#                                                                             DEVELOPED BY: BATES #
###################################################################################################
#                                                                                                 #
# SUMMARY: Install Terraform                                                                      #
#                                                                                                 #
###################################################################################################

# variables


EXEC=$(terraform -v | grep -i terraform)
EXEC_2=$(echo $EXEC)

if [ $(uname) = "Linux" ]; then
    if [ "$EXEC_2" ]; then
        echo "Terraform Instalado"
    else
        echo "Terraform não instalado"
        sudo apt update -y
        sudo apt upgrade -y
        wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
        sudo apt update && sudo apt install terraform
        echo "Terraform Instalado"
        terraform -v
        sleep 1
        echo "Instalando o 'tfenv' para gerenciamento de versão"
        git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
        echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
        mkdir -p ~/.local/bin/
        . ~/.profile
        ln -s ~/.tfenv/bin/* ~/.local/bin
        which tfenv
    fi
elif [ $(uname) = "Darwin" ]; then
    if [ "$EXEC_2" ]; then
        echo "Terraform Instalado"
    else
        echo "Terraform não instalado"
        sudo apt-get update -y > /dev/null 2> /dev/null && sudo apt-get upgrade -y > /dev/null 2> /dev/null
        /usr/bin/ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install) > /dev/null 2> /dev/null && sudo apt-get upgrade -y > /dev/null 2> /dev/null
        brew tap hashicorp/tap
        brew install hashicorp/tap/terraform
        echo echo "Instalando o 'tfenv' para gerenciamento de versão"
        brew install tfenv
    fi
else
    echo "Para instalação em outros sistemas operacionais siga a documentação no endereço"
    sleep 1
    echo "https://developer.hashicorp.com/terraform/downloads"
fi
