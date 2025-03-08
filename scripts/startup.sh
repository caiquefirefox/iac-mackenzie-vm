#!/bin/bash

# Atualiza o sistema
sudo apt-get update -y
sudo apt-get upgrade -y

# Instala dependências necessárias
sudo apt-get install -y unzip curl gnupg lsb-release software-properties-common

# -------------------------------------------
# INSTALANDO AWS CLI
# -------------------------------------------
echo "Instalando AWS CLI..."
# Baixa o instalador do AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# Descompacta o arquivo
unzip awscliv2.zip
# Executa o instalador
sudo ./aws/install
# Limpa os arquivos temporários
rm -rf awscliv2.zip aws/

# Configuração das credenciais AWS (substitua as variáveis abaixo pelos seus valores)
#aws configure set aws_access_key_id "SEU_ACCESS_KEY"
#aws configure set aws_secret_access_key "SEU_SECRET_KEY"
#aws configure set region "us-east-1"  # Substitua pela sua região desejada

# Verifica a instalação
aws --version

# -------------------------------------------
# INSTALANDO TERRAFORM
# -------------------------------------------
echo "Instalando Terraform..."
# Baixa a versão mais recente do Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
sudo apt update -y
sudo apt install -y terraform

# Verifica a instalação
terraform -v

# -------------------------------------------
# INSTALANDO ANSIBLE
# -------------------------------------------
echo "Instalando Ansible..."
# Instala o Ansible via apt
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update -y
sudo apt install -y ansible

# Verifica a instalação
ansible --version

# -------------------------------------------
# INSTALANDO PULUMI
# -------------------------------------------
echo "Instalando Pulumi..."
# Baixa o instalador do Pulumi
curl -fsSL https://get.pulumi.com | sh

# Adiciona o Pulumi ao PATH
export PATH=$PATH:/home/ubuntu/.pulumi/bin

# Verifica a instalação
pulumi version

# -------------------------------------------
# Concluído
# -------------------------------------------
echo "Instalação concluída com sucesso!"
