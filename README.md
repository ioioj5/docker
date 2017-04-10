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
	$ docker build -t ioioj5/nginx1.11.13 -f Dockerfile_nginx .
	```
4. 检查生成的Docker镜像

	```
	$ docker images
	```
5. 运行Docker镜像

	```
	$ docker run -name nginx1.11.13 -v /data/www:/data/www -p 80:80 -it ioioj5/nginx1.11.13
	```

两两容器的数据通信通过容器启动命令docker run加参数--link解决, --link参数的格式为  --link name:alias

	```
	$ docker run -name nginx1.11.13 -v /data/www:/data/www -p 80:80 -it ioioj5/nginx1.11.13 --link php5.6:php5.6
	```

6. 退出后重新进入Docker镜像, 访问容器内部

	```
	$ docker exec -it [CONTAINER_NAME or CONTAINER_ID] /bin/bash
	```


# 文件说明

Dockerfile_all_in_one: 整体打包lnmp开发环境