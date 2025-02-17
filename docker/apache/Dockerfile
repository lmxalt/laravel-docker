# FROM httpd:2.4

# COPY ./docker/apache/*.conf /etc/apache2/sites-available/000-default.conf

# # Включаем модуль mod_rewrite
# RUN a2enmod rewrite


FROM php:8.0-apache

# Установка необходимых модулей
RUN a2enmod proxy proxy_fcgi

# Копирование конфигурации виртуального хоста
COPY ./docker/apache/*.conf /etc/apache2/sites-available/000-default.conf
