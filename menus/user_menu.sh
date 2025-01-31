#!/bin/bash
source /usr/local/vps/libs/common.sh

user_menu() {
  while true; do
    clear
    msg_bar
    echo " MENÚ DE GESTIÓN DE USUARIOS"
    msg_bar
    local options=("Crear Usuario" "Eliminar Usuario" "Listar Usuarios" "Volver al Menú Principal")
    show_menu "${options[@]}"
    get_user_choice
    case $? in
      1) echo "Función para crear usuario" ;;
      2) echo "Función para eliminar usuario" ;;
      3) echo "Función para listar usuarios" ;;
      4) return ;;
      *) msg_error "Opción inválida. Intente de nuevo." ;;
    esac
    read -p "Presione Enter para continuar..."
  done
}
