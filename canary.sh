#!/bin/bash
ulimit -c unlimited
while true; do 

sudo apt update 
sudo apt dist-upgrade
sudo apt install git cmake build-essential autoconf libtool ca-certificates curl zip unzip tar pkg-config ninja-build ccache linux-headers-$(uname -r)
sudo apt remove --purge cmake
hash -r
sudo apt install snapd
sudo snap install cmake --classic
cmake --version
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt update
sudo apt install gcc-11 g++-11
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 100 --slave /usr/bin/g++ g++ /usr/bin/g++-11 --slave /usr/bin/gcov gcov /usr/bin/gcov-11
sudo update-alternatives --set gcc /usr/bin/gcc-11
gcc-11 --version
g++-11 --version
sudo apt install acl
setfacl -m u:www-data:rwx .
cd ~
git clone https://github.com/microsoft/vcpkg
cd vcpkg
./bootstrap-vcpkg.sh
cd ~
git clone --depth 1 https://github.com/opentibiabr/canary.git
cd canary
mv config.lua.dist config.lua
mkdir build && cd build
cmake -DCMAKE_TOOLCHAIN_FILE=~/vcpkg/scripts/buildsystems/vcpkg.cmake .. --preset linux-release
cmake --build linux-release
cd ~
cd canary
cp -r build/linux-release/bin/canary
sudo apt update
sudo apt install nginx
sudo service nginx start
sudo systemctl enable nginx
sudo apt install ufw
sudo ufw app list
sudo ufw allow in "Nginx Full"
sudo apt remove php*
sudo apt update
sudo apt upgrade
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
sudo apt install mysql-server
sudo service mysql start
sudo apt install mysql-serversudo service mysql start
cd /var/www/html
sudo wget -c https://github.com/opentibiabr/myaac/archive/refs/heads/main.zip -O myaac-global.zip
sudo unzip myaac-global.zip
sudo mv 'MyAAC Global'/* /var/www/html
sudo rm -rf myaac-global.zip 'MyAAC Global'
sudo rm index.html
sudo cp config.php config.local.php
sudo chown -R www-data.www-data /var/www/html
sudo chmod 660 config.php 
sudo chmod 660 config.local.php
sudo chmod 660 images/guilds
sudo chmod 660 images/houses
sudo chmod 660 images/gallery
sudo chmod -R 770 system/cache
sudo mysql -u root -p
CREATE USER 'global'@'localhost' IDENTIFIED WITH mysql_native_password BY '6oSN83Tp8AGpP6n';
GRANT ALL PRIVILEGES ON *.* TO 'global'@'localhost' WITH GRANT OPTION; 
exit

done
