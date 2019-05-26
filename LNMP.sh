#!/bin/bash
useradd -s /sbin/nologin nginx
yum -y install gcc pcre-devel openssl-devel
tar -xf /lnmp_soft.tar.gz 
cd /root/lnmp_soft
tar -xf nginx-1.12.2.tar.gz
cd nginx-1.12.2/
./configure --user=nginx --group=nginx --with-http_ssl_module --with-stream --with-http_stub_status_module
make && make install
yum -y install mariadb mariadb-server mariadb-devel
systemctl start mariadb
systemctl enable mariadb
yum -y install php php-fpm php-mysql
systemctl start php-fpm
systemctl enable php-fpm
echo -e "####\033[32mLNMP ALRADY ESTABLISHED\033[0m####"
