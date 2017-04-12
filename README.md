# README

> CentOS 6.8 x86_64

> kernel: 2.6.32-642.11.1.el6.x86_64

## 安装Docker

```
$ yum install docker-io
```

## 使用Docker

1. 创建Dockerfile

	```
	$ mkdir /data/docker
	$ cd /data/docker
	$ touche Dockerfile
	````

2. 编写Dockerfile

3. 生成Docker镜像, 指定Dockerfile

	```
	$ docker build -t ioioj5/mysql -f Dockerfile_mysql .
	$ docker build -t ioioj5/php -f Dockerfile_php .
	$ docker build -t ioioj5/nginx -f Dockerfile_nginx .
	```
4. 检查生成的Docker镜像

	```
	$ docker images
	```
5. 运行Docker镜像

	```
	$ sudo docker run --name mysql -p 3306:3306 -v /data/server/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -idt ioioj5/mysql
	$ sudo docker run --name php -p 9000:9000 --link mysql:mysql -idt ioioj5/php
	$ sudo docker run --name nginx -p 80:80 -v /data/www:/usr/local/nginx/html --link php:php -idt ioioj5/nginx
	```

6. 检查当前运行/不运行的容器

    ```
    $ sudo docker ps -a
    ```
    
7. 启动/关闭容器

    ```
    $ sudo docker start mysql/php/nginx
    $ sudo docker stop mysql/php/nginx
    ```
    

8. 退出后重新进入Docker镜像, 访问容器内部

	```
	$ docker exec -it [CONTAINER_NAME or CONTAINER_ID] /bin/bash
	```


# 文件说明

Dockerfile_all_in_one: 整体打包lnmp开发环境

Dockerfile_nginx : Nginx安装与配置

Dockerfile_php: PHP安装与配置

Dockerfile_mysql: MySQL安装与配置
