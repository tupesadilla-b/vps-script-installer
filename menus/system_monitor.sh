#!/bin/bash
source /usr/local/vps/libs/common.sh
source /usr/local/vps/libs/system_utils.sh

system_monitor() {
  while true; do
    clear
    msg_bar
    echo " MONITOR DEL SISTEMA"
    msg_bar
    echo "Uso de CPU: $(get_cpu_usage)%"
    echo "Uso de Memoria: $(get_memory_usage)"
    echo "IP Pública: $(get_public_ip)"
    echo "IP Privada: $(get_private_ip)"
    msg_bar
    echo "1) Actualizar"
    echo "2) Volver al Menú Principal"
    read -p "Seleccione una opción: " choice
    case $choice in
      1) continue ;;
      2) return ;;
      *) msg_error "Opción inválida. Intente de nuevo." ;;
    esac
  done
}
