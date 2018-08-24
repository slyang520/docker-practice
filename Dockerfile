# 第一行必须指定基于的基础镜像
FROM nginx:1.14.0

# 维护者信息
MAINTAINER  slyang slyang520@yeah.net

# 镜像的操作指令
#RUN cd /opt
#RUN mkdir slyang

# 网站
COPY ./www_web   /usr/share/nginx/html
# 把该目录下的  .conf 结尾的文件 复制到  /etc/nginx/conf.d
COPY ./nginx_config/conf.d/*.conf   /etc/nginx/conf.d
# nginx.conf 文件 覆盖  /etc/nginx/nginx.conf
COPY ./nginx_config/nginx.conf   /etc/nginx/nginx.conf

# 向外部暴露端口
EXPOSE 80

#通过 VOLUME 指令创建的挂载点，无法指定主机上对应的目录，是自动生成的
#VOLUME ["/opt/slyang","/opt/slyang2"]

# ENTRYPOINT

# docker run -d -it -p 9090:80 -v /Users/slyang/openSourceProject/web/baidu-school-2017/nginx_log:/var/log/nginx slynginx

# 后台运行
# -d

#  支持交互式  -it
#  -t, --tty=false            分配tty设备，该可以支持终端登录
#  -i, --interactive=false    打开STDIN，用于控制台交互

# 端口映射  9090宿主机端口 > 80 容器端口
# -p 9090:80

# 文件挂载   [host_path]:[container_path]
# 宿主机文件给 nginx访问
# -v /Users/slyang/openSourceProject/web/baidu-school-2017:/opt/slyang
# nginx 文件写入到宿主机
# -v /Users/slyang/openSourceProject/web/baidu-school-2017/nginx_log:/var/log/nginx

# 容器启动时执行指令
# nginx 后台运行
#CMD /usr/sbin/nginx
CMD ["nginx", "-g", "daemon off;"]