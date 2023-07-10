#!/bin/bash
ulimit -c unlimited
while true; do 

sudo apt update
sudo apt install nginx
sudo service nginx start
sudo systemctl enable nginx
​sudo apt install ufw
sudo ufw app list
sudo ufw allow in "Nginx Ful
sudo apt install mariadb-server
sudo service mariadb start
sudo mysql -u root -p
CREATE USER 'global'@'localhost' IDENTIFIED WITH mysql_native_password BY 'serverglobal1234';
GRANT ALL PRIVILEGES ON *.* TO 'your_user'@'localhost' WITH GRANT OPTION; 
exit
sudo mysql_secure_installation
sudo apt remove php*
sudo apt update
sudo apt upgrade
sudo apt install python3-launchpadlib
sudo apt install software-properties-common apt-transport-https -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php7.4 php7.4-cli php7.4-curl php7.4-fpm php7.4-gd php7.4-json php7.4-mysql php7.4-xml php7.4-zip php7.4-bcmath php7.4-mbstring -y
php7.4 -v
sudo apt purge apache2*
sudo apt autoremove
cd /
cd etc
sudo rm -r apache2
sudo apt install phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
# Contenido de reemplazo
contenido_reemplazo=$(cat <<EOL
server {
    listen       80;
    listen       [::]:80;
    #   listen       443 ssl http2;
    #   listen       [::]:443 ssl http2;

    server_name _;
    #   server_name example.com  www.example.com;

    root   /var/www/html/;
    index index.php index.html index.htm;

    #   if ($host !~ ^(exemple.com|www.example.com)$){
    #       return 400;
    #   }

    if (\$request_method !~ ^(GET|HEAD|POST)$) {
        return 444;
    }

    location ~ /system {
        deny all;
        return 404;
    }

    location ~ /\.ht {
        deny all;
    }

    location ~ /\.git {
        return 403;
    }

    location ~* \.(pl|cgi|py|sh|lua)\$ {
        return 403;
    }

    location ~* ^/wp-content/uploads/.*\.(asp|cgi|htm|html|js|jsp|php|pl|py|sh|shtml|swf)$ {
        return 403;
    }

    location ~* ^/(readme|license|schema|password|passwords).*\.(txt|html)$ {
        return 403;
    }

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
        #       try_files \$uri \$uri/ /index.php;
    }

    location ~ ^/(conf|doc|sql|setup)/ {
        deny all;
        return 403;
    }

    #   Pass PHP Scripts To FastCGI Server
    location ~ \.php$ {
        #       root /var/www/html/;
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOL
)
sudo tee "$archivo" <<< "$contenido_reemplazo" > /dev/null
sudo service nginx restart

exit

done
