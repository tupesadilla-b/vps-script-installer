#!/bin/bash
source /usr/local/vps/libs/common.sh

connection_menu() {
  while true; do
    clear
    msg_bar
    echo " MENÚ DE GESTIÓN DE CONEXIONES"
    msg_bar
    local options=("Instalar Métodos de Conexión" "Configurar Conexión" "Listar Métodos Activos" "Volver al Menú Principal")
    show_menu "${options[@]}"
    get_user_choice
    case $? in
      1) echo "Función para instalar métodos de conexión" ;;
      2) echo "Función para configurar conexión" ;;
      3) echo "Función para listar métodos activos" ;;
      4) return ;;
      *) msg_error "Opción inválida. Intente de nuevo." ;;
    esac
    read -p "Presione Enter para continuar..."
  done
}
