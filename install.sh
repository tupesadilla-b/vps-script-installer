,bin/bash

# Directorio de instalación
INSTALL_DIR="/usr/local/vps"

# Clonar el repositorio
echo "Clonando el repositorio..."
git clone https://github.com/tupesadilla-b/vps_manager.git "$INSTALL_DIR" || {
    echo "Error al clonar el repositorio."
    exit 1
}

# Establecer permisos
echo "Estableciendo permisos..."
chmod -R +x "$INSTALL_DIR"

# Crear enlace simbólico para ejecutar desde cualquier lugar
ln -sf "$INSTALL_DIR/vps_manager.sh" /usr/local/bin/vps_manager

echo "Instalación completada. Use el comando 'vps_manager' para iniciar."
