#!/bin/bash
ulimit -c unlimited
while true; do 


sudo apt-get update
sudo apt-get upgrade
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
cd ~
git clone https://github.com/microsoft/vcpkg
cd vcpkg
./bootstrap-vcpkg.sh
cd ..
git clone --depth 1 https://github.com/opentibiabr/canary.git
cd canary
mkdir build && cd build
cmake -DCMAKE_TOOLCHAIN_FILE=~/vcpkg/scripts/buildsystems/vcpkg.cmake .. --preset linux-release
cmake --build linux-release
sudo apt-get install apache2
sudo apt-get install php
sudo apt-get install mysql-server
sudo apt-get install libapache2-mod-auth-mysql
sudo apt-get install php-mysql
sudo apt-get install phpmyadmin
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libboost-all-dev
sudo apt-get install php-xml
sudo apt-get install php-gd
sudo apt-get install php-curl
sudo apt-get install php-mbstring php-mbstring php-gettext
sudo apt-get install php-xml
sudo apt-get update
sudo apt-get upgrade
sudo ln -s /usr/share/phpmyadmin /var/www/html
sudo /etc/init.d/apache2 reload
sudo mysql_secure_installation
sudo mysql -u root
use mysql
update user set plugin='' where User='root';
flush privileges;
exit

done
