#!/bin/bash
source /usr/local/vps/libs/common.sh
source /usr/local/vps/libs/menu_helpers.sh

main_menu() {
  while true; do
    clear
    msg_bar
    echo " MENÚ PRINCIPAL"
    msg_bar
    local options=("Gestión de Usuarios" "Gestión de Conexiones" "Monitor del Sistema" "Salir")
    show_menu "${options[@]}"
    get_user_choice
    case $? in
      1) source /usr/local/vps/menus/user_menu.sh && user_menu ;;
      2) source /usr/local/vps/menus/connection_menu.sh && connection_menu ;;
      3) source /usr/local/vps/menus/system_monitor.sh && system_monitor ;;
      4) exit 0 ;;
      *) msg_error "Opción inválida. Intente de nuevo." ;;
    esac
    read -p "Presione Enter para continuar..."
  done
}

main_menu
