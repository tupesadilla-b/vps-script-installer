#!/bin/bash
# Menú principal para VPS

source /usr/local/vps/libs/common.sh

menu() {
  clear
  msg_bar
  echo -e "\033[1;36m         MENU PRINCIPAL - VPS CONFIGURATOR\033[0m" | lolcat
  msg_bar
  echo -e "\033[1;33m1.\033[0m Ver estado del sistema"
  echo -e "\033[1;33m2.\033[0m Configurar dominio"
  echo -e "\033[1;33m3.\033[0m Cambiar zona horaria"
  echo -e "\033[1;33m4.\033[0m Salir"
  msg_bar
  read -p "Seleccione una opción: " opcion

  case $opcion in
    1) bash /usr/local/vps/menus/system_status.sh ;;
    2) bash /usr/local/vps/menus/configure_domain.sh ;;
    3) bash /usr/local/vps/menus/change_timezone.sh ;;
    4) exit ;;
    *) echo -e "\033[1;31mOpción inválida.\033[0m"; menu ;;
  esac
}

menu
