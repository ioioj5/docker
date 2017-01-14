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

3. 生成Docker镜像

	```
	$ docker build ioioj5/lnmp
	```
4. 检查生成的Docker镜像

	```
	$ docker images
	```
5. 运行Docker镜像

	```
	$ docker run -t -i ioioj5/lnmp /bin/bash
	```