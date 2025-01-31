#!/bin/bash

# Directorio de instalación
INSTALL_DIR="/usr/local/vps"

# Crear directorios
echo "Creando directorios necesarios..."
mkdir -p "$INSTALL_DIR/menus" "$INSTALL_DIR/libs"

# Descargar archivos principales
echo "Descargando archivos principales..."
cat > "$INSTALL_DIR/vps_manager.sh" << 'EOF'
#!/bin/bash

# Directorio base
BASE_DIR="/usr/local/vps"

# Cargar librerías principales
source "$BASE_DIR/libs/common.sh"
source "$BASE_DIR/libs/menu_helpers.sh"

# Ejecutar el menú principal
if [[ -f "$BASE_DIR/menus/main_menu.sh" ]]; then
    source "$BASE_DIR/menus/main_menu.sh"
    main_menu
else
    echo "Error: No se encontró el archivo 'main_menu.sh' en $BASE_DIR/menus/"
    exit 1
fi
EOF

# Descargar librerías
echo "Descargando librerías..."
cat > "$INSTALL_DIR/libs/common.sh" << 'EOF'
#!/bin/bash

msg_bar() {
    echo "==============================="
}

msg_error() {
    echo -e "\e[31m[ERROR]\e[0m $1"
}

msg_success() {
    echo -e "\e[32m[SUCCESS]\e[0m $1"
}
EOF

cat > "$INSTALL_DIR/libs/menu_helpers.sh" << 'EOF'
#!/bin/bash

show_menu() {
    local options=("$@")
    for i in "${!options[@]}"; do
        echo "$((i+1))) ${options[$i]}"
    done
}

get_user_choice() {
    read -p "Seleccione una opción: " choice
    if [[ $choice =~ ^[0-9]+$ && $choice -ge 1 && $choice -le ${#options[@]} ]]; then
        return $choice
    else
        return -1
    fi
}
EOF

cat > "$INSTALL_DIR/libs/system_utils.sh" << 'EOF'
#!/bin/bash

get_cpu_usage() {
    top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}'
}

get_memory_usage() {
    free -h | awk '/^Mem:/ {print $3 "/" $2}'
}

get_public_ip() {
    curl -s ifconfig.me
}

get_private_ip() {
    hostname -I | awk '{print $1}'
}
EOF

# Descargar menús
echo "Descargando menús..."
cat > "$INSTALL_DIR/menus/main_menu.sh" << 'EOF'
#!/bin/bash

main_menu() {
    clear
    echo "=== MENÚ PRINCIPAL ==="
    echo "1) Menú de usuarios"
    echo "2) Menú de conexión"
    echo "3) Monitoreo del sistema"
    echo "4) Salir"
    read -p "Seleccione una opción: " opt
    case $opt in
        1) source "$BASE_DIR/menus/user_menu.sh"; user_menu ;;
        2) source "$BASE_DIR/menus/connection_menu.sh"; connection_menu ;;
        3) source "$BASE_DIR/menus/system_monitor.sh"; system_monitor ;;
        4) exit 0 ;;
        *) echo "Opción inválida."; sleep 2; main_menu ;;
    esac
}
EOF

cat > "$INSTALL_DIR/menus/user_menu.sh" << 'EOF'
#!/bin/bash

user_menu() {
    clear
    echo "=== MENÚ DE USUARIOS ==="
    echo "Funcionalidad pendiente..."
    sleep 2
}
EOF

cat > "$INSTALL_DIR/menus/connection_menu.sh" << 'EOF'
#!/bin/bash

connection_menu() {
    clear
    echo "=== MENÚ DE CONEXIÓN ==="
    echo "Funcionalidad pendiente..."
    sleep 2
}
EOF

cat > "$INSTALL_DIR/menus/system_monitor.sh" << 'EOF'
#!/bin/bash

system_monitor() {
    clear
    echo "=== MONITOREO DEL SISTEMA ==="
    echo "CPU Uso: $(get_cpu_usage)%"
    echo "RAM Uso: $(get_memory_usage)"
    echo "IP Pública: $(get_public_ip)"
    echo "IP Privada: $(get_private_ip)"
    read -p "Presione Enter para regresar al menú principal..."
    main_menu
}
EOF

# Configurar permisos
echo "Configurando permisos..."
chmod -R +x "$INSTALL_DIR"

# Crear enlace simbólico
ln -sf "$INSTALL_DIR/vps_manager.sh" /usr/local/bin/vps_manager

echo "Instalación completada. Use el comando 'vps_manager' para iniciar."
