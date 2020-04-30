#!/bin/sh

sed -i "s/file_uploads =.*/file_uploads = ${PHP_FILE_UPLOADS}/g" /etc/php/${PHP_VERSION}/mods-available/99_upload.ini
sed -i "s/upload_max_filesize =.*/upload_max_filesize = ${PHP_UPLOAD_MAX_SIZE}/g" /etc/php/${PHP_VERSION}/mods-available/99_upload.ini
sed -i "s/post_max_size =.*/post_max_size = ${PHP_UPLOAD_MAX_SIZE}/g" /etc/php/${PHP_VERSION}/mods-available/99_upload.ini

sed -i "s/opcache.enable=.*/opcache.enable=${PHP_OPCACHE_ENABLE}/g" /etc/php/${PHP_VERSION}/mods-available/99_opcache.ini
sed -i "s/opcache.validate_timestamps=.*/opcache.validate_timestamps=${PHP_OPCACHE_VALIDATE_TIMESTAMPS}/g" /etc/php/${PHP_VERSION}/mods-available/99_opcache.ini
sed -i "s/opcache.max_accelerated_files=.*/opcache.max_accelerated_files=${PHP_OPCACHE_MAX_ACCELERATED_FILES}/g" /etc/php/${PHP_VERSION}/mods-available/99_opcache.ini
sed -i "s/opcache.memory_consumption=.*/opcache.memory_consumption=${PHP_OPCACHE_MEMORY_CONSUMPTION}/g" /etc/php/${PHP_VERSION}/mods-available/99_opcache.ini
sed -i "s/opcache.max_wasted_percentage=.*/opcache.max_wasted_percentage=${PHP_OPCACHE_MAX_WASTED_PERCENTAGE}/g" /etc/php/${PHP_VERSION}/mods-available/99_opcache.ini
sed -i "s/opcache.interned_strings_buffer=.*/opcache.interned_strings_buffer=${PHP_OPCACHE_INTERNED_STRINGS_BUFFER}/g" /etc/php/${PHP_VERSION}/mods-available/99_opcache.ini

echo "max_execution_time = ${PHP_MAX_EXECUTION_TIME}" > /etc/php/${PHP_VERSION}/mods-available/99_max_execution_time.ini


sed -i "s#default unix:.*#default unix:/run/php/php${PHP_VERSION}-fpm.sock;#g" /etc/nginx/sites-available/default