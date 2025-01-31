#!/bin/bash
source /usr/local/vps/libs/common.sh
source /usr/local/vps/libs/security_utils.sh

advanced_settings() {
  while true; do
    clear
    msg_bar
    echo " CONFIGURACIONES AVANZADAS"
    msg_bar
    local options=("Abrir Puerto" "Cerrar Puerto" "Ver Logs del Sistema" "Volver al Menú Principal")
    show_menu "${options[@]}"
    get_user_choice
    case $? in
      1) read -p "Ingrese el puerto a abrir: " port; open_port "$port" ;;
      2) read -p "Ingrese el puerto a cerrar: " port; close_port "$port" ;;
      3) echo "Mostrando logs del sistema..."; journalctl -xe ;;
      4) return ;;
      *) msg_error "Opción inválida. Intente de nuevo." ;;
    esac
    read -p "Presione Enter para continuar..."
  done
}
