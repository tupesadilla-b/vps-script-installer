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
