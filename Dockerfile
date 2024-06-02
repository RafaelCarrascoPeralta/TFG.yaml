# Usa una imagen base de PHP con Apache
FROM php:7.4-apache

# Establece el directorio de trabajo
WORKDIR /var/www/html

# Copia los archivos de la aplicación al contenedor
COPY . .

# Instala las extensiones necesarias para MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Expone el puerto 80 para Apache
EXPOSE 80

# Define el comando para ejecutar Apache en segundo plano
CMD ["apache2-foreground"]
