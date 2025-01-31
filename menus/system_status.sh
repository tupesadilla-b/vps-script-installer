#!/bin/bash
# Mostrar estado del sistema

source /usr/local/vps/libs/common.sh

clear
msg_bar
echo -e "\033[1;36m      ESTADO DEL SISTEMA\033[0m" | lolcat
msg_bar
echo -e "\033[1;33mHostname:\033[0m $(hostname)"
echo -e "\033[1;33mUptime:\033[0m $(uptime -p)"
echo -e "\033[1;33mRAM libre:\033[0m $(free -h | awk '/Mem:/ {print $4}')"
echo -e "\033[1;33mFecha/Hora:\033[0m $(date)"
msg_bar
read -p "Presione Enter para volver al menú..." && bash /usr/local/vps/menu.sh
