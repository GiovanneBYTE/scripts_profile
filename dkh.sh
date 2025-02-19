#!/bin/bash

known_hosts=$HOME/.ssh/known_hosts

read -p "Digite o octeto do host:" host_line

if grep -q "$host_line" "$known_hosts"; then
	sed -i "/$host_line/d" "$known_hosts"
	ssh -o StrictHostKeyChecking=no root@192.168.$host_line

else
	echo "Host não encontrado em $known_hosts!"
fi




