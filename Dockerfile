FROM php:8.2-apache

# Enable Apache mod_rewrite and mod_headers for .htaccess support
RUN a2enmod rewrite headers

# Allow .htaccess files to override configuration in the web root
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Copy the entire project into the web root
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
