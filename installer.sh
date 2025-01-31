#!/bin/bash
# Instalador principal para VPS Script desde GitHub

REPO_URL="https://raw.githubusercontent.com/tupesadilla-b/vps-script-installer/main"

msg_bar() {
  echo -e "\033[1;32m=====================================================\033[0m"
}

msg_info() {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

msg_ok() {
  echo -e "\033[1;32m[OK]\033[0m $1"
}

msg_error() {
  echo -e "\033[1;31m[ERROR]\033[0m $1"
}

# Instalar dependencias necesarias
install_dependencies() {
  msg_bar
  msg_info "Instalando dependencias necesarias..."
  apt-get update -y &>/dev/null
  apt-get install -y bsdmainutils screen python3 python3-pip npm nodejs lsof apache2 nmap socat figlet lolcat &>/dev/null
  msg_ok "Dependencias instaladas correctamente."
}

# Descargar y preparar scripts
setup_scripts() {
  msg_info "Preparando la estructura de archivos..."
  mkdir -p /usr/local/vps/menus /usr/local/vps/libs
  wget -q -O /usr/local/vps/menu.sh "$REPO_URL/menu.sh"
  wget -q -O /usr/local/vps/menus/system_status.sh "$REPO_URL/menus/system_status.sh"
  wget -q -O /usr/local/vps/menus/configure_domain.sh "$REPO_URL/menus/configure_domain.sh"
  wget -q -O /usr/local/vps/menus/change_timezone.sh "$REPO_URL/menus/change_timezone.sh"
  wget -q -O /usr/local/vps/libs/common.sh "$REPO_URL/libs/common.sh"
  chmod +x /usr/local/vps/*.sh /usr/local/vps/menus/*.sh
  msg_ok "Scripts descargados y preparados correctamente."
}

# Ejecución principal
main() {
  install_dependencies
  setup_scripts
  msg_ok "Instalación completa. Use 'bash /usr/local/vps/menu.sh' para iniciar."
}

main
