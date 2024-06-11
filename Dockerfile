# Usa una imagen base de PHP con Apache
FROM php:7.4-apache

# Establece el directorio de trabajo
WORKDIR /var/www/html

# Copia los archivos de la aplicación al contenedor
COPY . .

# Instala las extensiones necesarias para MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Otorga permisos completos al directorio /tmp
RUN chmod -R 777 /tmp

# Crea los directorios necesarios si no existen y otorga permisos adecuados
RUN mkdir -p /var/www/html/imagen /var/www/html/admin/imagen \
    && chmod -R 777 /var/www/html/imagen /var/www/html/admin/imagen

# Expone el puerto 80 para Apache
EXPOSE 80

# Define el comando para ejecutar Apache en segundo plano
CMD ["apache2-foreground"]

