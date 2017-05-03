#!/bin/bash
mkdir /opt/mysql
mv mysql-5.6.35-linux-glibc2.5-x86_64.tar.gz /opt/mysql/
tar -zxf /opt/mysql/mysql-5.6.35-linux-glibc2.5-x86_64.tar.gz -C /opt/mysql/
mkdir -p /data/mysql/mysql_3306/{data,tmp,logs}
groupadd mysql
ln -s /opt/mysql/mysql-5.6.35-linux-glibc2.5-x86_64 /usr/local/mysql
useradd -M -g mysql -s /sbin/nologin -d /usr/local/mysql mysql
chown -R mysql:mysql /data/mysql/mysql_3306/*
cp -a /usr/local/mysql/support-files/mysql.server /etc/init.d/mysqld
rpm -ivh libaio-0.3.107-10.el6.x86_64.rpm
cd /usr/local/mysql/
./scripts/mysql_install_db
echo "export PATH=$PATH:/usr/local/mysql/bin" >> /etc/profile
source /etc/profile