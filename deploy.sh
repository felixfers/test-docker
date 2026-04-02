#!/bin/bash

# 1. Definir variables (Buenas prácticas)
DESTINO="/var/www/html"
ORIGEN=$(pwd)

echo "🚀 Iniciando despliegue..."

# 2. Simular o ejecutar la copia del archivo
# Usamos 'sudo' porque /var/www/html es una carpeta protegida
sudo cp $ORIGEN/index.html $DESTINO/index.html

echo "✅ Despliegue completado con éxito."
