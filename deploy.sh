#!/bin/bash

DESTINO="/var/www/html"
ORIGEN=$(pwd)

echo "🚀 Iniciando despliegue..."
sudo cp $ORIGEN/index.html $DESTINO/index.html
echo "✅ Archivos copiados."

# --- NUEVA SECCIÓN: HEALTH CHECK ---
echo "🧐 Verificando la salud del sitio..."

# curl -s (silencioso) -o /dev/null (no queremos ver el HTML) 
# -w "%{http_code}" (queremos ver el código de estado HTTP, ej. 200)
ESTADO=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

if [ $ESTADO -eq 200 ]; then
    echo "🔥 ¡ÉXITO! El sitio está online (Código 200)."
else
    echo "❌ ERROR: El sitio devolvió código $ESTADO. Revisa Nginx."
    exit 1
fi
