#!/bin/bash

# Atualiza o sistema
apt-get update -y
apt-get upgrade -y

# Instala dependências necessárias
apt-get install -y unzip curl gnupg lsb-release software-properties-common

# -------------------------------------------
# INSTALANDO AWS CLI
# -------------------------------------------
echo "Instalando AWS CLI..."

mkdir -p ~/.aws

# Criar o arquivo de credenciais
echo "[default]" > ~/.aws/credentials
echo "aws_access_key_id = SEU_ACCESS_KEY" >> ~/.aws/credentials
echo "aws_secret_access_key = SEU_SECRET_KEY" >> ~/.aws/credentials

# Criar o arquivo de configuração da região e formato de saída
echo "[default]" > ~/.aws/config
echo "region = sa-east-1" >> ~/.aws/config  # Região São Paulo (substitua conforme necessário)
echo "output = json" >> ~/.aws/config       # Formato de saída JSON

# Configuração das credenciais AWS (substitua as variáveis abaixo pelos seus valores)
export AWS_ACCESS_KEY_ID="SEU_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="SEU_SECRET_KEY"
export AWS_DEFAULT_REGION="sa-east-1"  # Região São Paulo (substitua conforme necessário)
export AWS_DEFAULT_OUTPUT="json" 

# Baixa o instalador do AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# Descompacta o arquivo
unzip awscliv2.zip
# Executa o instalador
./aws/install
# Limpa os arquivos temporários
rm -rf awscliv2.zip aws/

# Verifica a instalação
aws --version

# -------------------------------------------
# INSTALANDO TERRAFORM
# -------------------------------------------
echo "Instalando Terraform..."
# Baixa a versão mais recente do Terraform
apt update -y
apt install gpg
apt install wget
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
apt install -y terraform

# Verifica a instalação
terraform -v

# -------------------------------------------
# INSTALANDO ANSIBLE
# -------------------------------------------
echo "Instalando Ansible..."
# Instala o Ansible via apt
apt-add-repository -y ppa:ansible/ansible
apt update -y
apt install -y ansible
export LC_ALL="C.UTF-8"

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
