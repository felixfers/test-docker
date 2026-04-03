# Paso 1: Usamos una imagen ligera de Nginx
FROM nginx:alpine

# Paso 2: Copiamos nuestro HTML a la carpeta donde Nginx sirve contenido
COPY index.html /usr/share/nginx/html/index.html

# Paso 3: Exponemos el puerto 80
EXPOSE 80
