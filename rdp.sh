#!/bin/bash

#Script para usar o rdesktop de forma mais interativa e produtiva

#solicita o nome de usuario 
read -p "Digite o nome de usuário da maquina: " usuario

# Solicita a senha
#read -sp "Digite a senha: " senha
#echo

# Solicita o endereço do servidor
read -p "Digite o endereço da maquina a ser acessada: " servidor

# Executa o rdesktop com os parâmetros fornecidos
rdesktop -u "$usuario" -p "$usuario" 192.168."$servidor"
