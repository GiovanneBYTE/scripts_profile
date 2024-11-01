#!/bin/bash

#Script para usar o rdesktop de forma mais interativa e produtiva

#mostra a ultima execução conforme o /var/log/rdp.log
echo "Ultima execução:"

tail -7 /var/log/rdp.log

#solicita o nome de usuario 
read -p "Digite o nome de usuário da maquina: " usuario

# Solicita o endereço do servidor
read -p "Digite o endereço da maquina a ser acessada: " servidor

if [ $usuario != "Administrador" ]; then

# Executa o rdesktop com os parâmetros fornecidos
	rdesktop -u "$usuario" -p "$usuario" 192.168."$servidor"

else
	# Solicita a senha
        read -sp "Digite a senha do usuário Administrador: " senha

	rdesktop -u "$usuario" -p "$senha" 192.168."$servidor"
fi

agora=$(date '+%Y-%m-%d %H:%M:%S')

echo "Data e hora:$agora" >> /var/log/rdp.log
echo "Usuario:$usuario" >> /var/log/rdp.log
echo "Senha:$senha" >> /var/log/rdp.log
echo "Sevidor/Maquina:192.168.$servidor" >> /var/log/rdp.log
echo "                                 " >> /var/log/rdp.log
echo "################################ " >> /var/log/rdp.log
echo "                                 " >> /var/log/rdp.log
