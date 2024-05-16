sleep 5 #just to make sure the mariadb container has finished, remember the container not the image

if [ ! -f /var/www/wp-config.php ]
then
	echo "installing wordpress ..."
	cd /var/www
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp --allow-root --path=/var/www/  core download
	wp --allow-root --path=/var/www/  config create --dbname=$DB_NAME --dbuser=$WP_USER --dbpass=$WP_PASS --dbhost=mariadb:3306
	wp --allow-root --path=/var/www/  core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_name=$WP_ADMIN --admin_password=$WP_PASS --admin_email=$WP_EMAIL
	wp --allow-root user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD
	wp --allow-root theme install twentytwentytwo --activate
	#wp --allow-root plugin install redis-object-cache --activate
	chown -R www-data:www-data /var/www 
else
	echo "wordpress is already in"
fi

php-fpm8.2 -F

