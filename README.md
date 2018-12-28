# 构建镜像
```
docker build -t slyapp:mytag .

slyapp 本地镜像名
mytag 镜像tag

docker build -t slyapp:mytag -f /path/you_path .

```

# 导出容器id(一个镜像运行的实例)     到本地文件
```
 docker export <CONTAINER ID> > /home/export.tar

```

# 导出镜像 到本地文件

```
docker save slyangnginx:latest -o hello.tar
docker save 57ec22544 -o hello.tar

slyapp 本地镜像名
latest 镜像tag
-o hello.tar  镜像输出的文件

57ec22544 镜像

```

# 本地镜像文件  导入到成 docker镜像

```
docker load -i hello.tar 
docker load < hello.tar 

本地镜像源 文件
```

# 删除镜像
```
根据镜像名：tag 删除
docker rmi slyangnginx:123
slyangnginx 镜像名
123 tag

根据镜像ID 删除
docker rmi <image_id>
```

# 查看容器
```
docker ps 查看运行中的进程
docker ps -a 查看所有进程 包括已经停止的
```

# 删除容器
```
docker rm <CONTAINER_id>

```

# docker 启动
```
 docker 基于镜像启动
 docker run -d -it -p 9090:80 -v /Users/slyang/openSourceProject/web/baidu-school-2017/nginx_log:/var/log/nginx slyangnginx:latest

 docker 基于容器ID 启动 
 将一个已经终止的容器启动运行起来
 docker start <CONTAINER_ID>   
 
 将一个已经终止的容器或正在运行的容器 重新启动
 docker restart <CONTAINER_ID>   

```

# 进入docker容器
```
 docker exec -it <CONTAINER_ID> bash
 则是在容器中打开新的终端，并且可以启动新的进程

 docker attach <CONTAINER_ID>    
 不推荐使用
 attach 直接进入容器 启动命令 的终端，不会启动新的进程

```
