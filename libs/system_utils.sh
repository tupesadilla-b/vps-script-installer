#!/bin/bash

get_cpu_usage() {
  top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | xargs printf "%.1f\n"
}

get_memory_usage() {
  free -h | awk '/Mem:/ {print $3 "/" $2}'
}

is_service_active() {
  systemctl is-active --quiet "$1" && echo "Activo" || echo "Inactivo"
}
