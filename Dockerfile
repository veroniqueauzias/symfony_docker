FROM php:8.2-fpm

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Créer un utilisateur www-data
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

# Définir le répertoire de travail
WORKDIR /var/www/html
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data