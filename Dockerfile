# Dockerfile
# php + nginx + mysql
# Based on CentOS 6

# @date 2017-01-14
# @version 1.0
# @author: ioioj5 <peng_du2007@qq.com>
# Command format: Instruction [arguments / command] ..

# Base image
FROM centos:6

# Maintainer
MAINTAINER ioioj5 peng_du2007@qq.com

# - Commands Start - #

# set up EPEL repository
RUN rpm -Uvh http://mirrors.kernel.org/fedora-epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum repolist

# update the image and install dependencies
RUN yum -y install wget && wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
RUN yum makecache
RUN yum -y install gcc gcc-c++ gcc-g77 make libtool autoconf patch unzip automake libxml2 libxml2-devel ncurses ncurses-devel libtool-ltdl-devel libtool-ltdl libmcrypt libmcrypt-devel libpng libpng-devel libjpeg-devel openssl openssl-devel curl curl-devel libxml2 libxml2-devel ncurses ncurses-devel libtool-ltdl-devel libtool-ltdl autoconf automake libaio*i


# remove httpd, mysql, php
RUN yum remove httpd mysql php

# install Nginx
RUN yum -y install nginx
RUN service nginx start
RUN chkconfig --levels 235 nginx on

# install Mysql
RUN yum -y install mysql mysql-server mysql-devel
RUN service mysqld start
RUN chkconfig --levels 235 mysqld on
#RUN mysqladmin -u root password "123456"
RUN service mysqld restart

# install php
RUN yum -y install php lighttpd-fastcgi php-cli php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-mcrypt php-mssql php-snmp php-soap php-tidy php-common php-devel php-fpm
RUN service php-fpm start
RUN chkconfig --levels 235 php-fpm on

# backup config nginx, php, mysql

# restart nginx,php,mysql
RUN service nginx restart && service php-fpm restart && service mysqld restart

# mount
VOLUME ["/data/www"]

# - Commands End - #