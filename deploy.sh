#!/bin/bash

LOG_FILE="deploy_history.log"
DESTINO="/var/www/html"

# Función para loggear con fecha
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

echo "🚀 Desplegando..."
if sudo cp index.html $DESTINO/index.html; then
    log_message "SUCCESS: Despliegue realizado correctamente."
else
    log_message "ERROR: Falló la copia de archivos."
    exit 1
fi

# Health check
ESTADO=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)
log_message "HEALTH CHECK: Código $ESTADO"
