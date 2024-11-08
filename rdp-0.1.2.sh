#!/bin/bash

#Script para usar o rdesktop de forma mais interativa e produtiva

#variaveis para utilizar a ultima conexão do log;
userLog=$(tail -7 /var/log/rdp.log | awk -F":" 'NR==2 {print $2}' )
servLog=$(tail -7 /var/log/rdp.log | awk -F":" 'NR==4 {print $2}' )

#mostra a ultima execução conforme o /var/log/rdp.log
echo "                "
echo "Ultima execução:"

tail -8 /var/log/rdp.log

#Pergunta se deseja utilizar a ultima conexão efetudada
while true; do

  read -p "Deseja utilizar a ultima conexão efetuada? (s/n): " resposta

  if [[ "$resposta" == "s" ]]; then

	 rdesktop -u "$userlog" -p "$userLog" "$servLog"

    

  elif [[ "$resposta" == "n" ]]; then

	  break
  else

    echo "Resposta inválida. Digite 's' para sim ou 'n' para não."

  fi

done


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
echo "                                " >> /var/log/rdp.log
echo "Data e hora:$agora" >> /var/log/rdp.log
echo "Usuario:$usuario" >> /var/log/rdp.log
echo "Senha:$senha" >> /var/log/rdp.log
echo "Sevidor/Maquina:192.168.$servidor" >> /var/log/rdp.log
echo "                                 " >> /var/log/rdp.log
echo "################################ " >> /var/log/rdp.log
echo "                                 " >> /var/log/rdp.log
