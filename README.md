# 关于



**目的**：支持 Docker 部署应用，附加支持前端访问认证；



**weekly-report**

包含离线、在线，其主要区别在于镜像构建时，是否包含 weekly-report 依赖的 node modules;

**离线**：本地完成 node modules安装，容器运行无需额外网络，运行速度快，缺点镜像过大；

**在线**：容器运行时 node modules 才被加载，镜像相对较小，但是容器运行时依赖外网、运行速度相对较慢（如果持久化仅本地运行较慢）；



**weekly-report-web** 

基于 Nginx Basic Auth 认证，反向代理到 weekly-report ；





# 基于 CentOS 构建镜像


## 构建离线镜像

### 获取 Dockerfile

```
git clone https://github.com/Kry1702/weekly-report-docker.git
```



### 进入工作目录

```
cd weekly-report-docker/Dockerfiile/weekly-report-offline
```



### 获取代码

```
git clone https://github.com/guaguaguaxia/weekly_report.git
```



### 回滚代码

```
cd weekly_report
git reset --hard 78c4c4ac8b25b03cf943c119535955e419efcc7c
```



### 修改变量

```
cp .env.example .env
sed -s "#OPENAI_API_KEY=#OPENAI_API_KEY=openai-api-key#g" .env
```



### 安装

```
npm install
```



### 构建镜像

```
chmod +x ../run.sh
docker  build  -t  weekly_report-offline:v1.0.0 ../
```



## 构建在线镜像

### 获取 Dockerfile

```
git clone https://github.com/Kry1702/weekly-report-docker.git
```



### 进入工作目录

```
cd weekly-report-docker/Dockerfiile/weekly-report-online
```



### 获取代码

```
git clone https://github.com/guaguaguaxia/weekly_report.git
```



### 回滚代码

```
cd weekly_report
git reset --hard 78c4c4ac8b25b03cf943c119535955e419efcc7c
```



### 修改变量

```
cp .env.example .env
sed -s "#OPENAI_API_KEY=#OPENAI_API_KEY=openai-api-key#g" .env
```



### 构建镜像

```
chmod +x ../run.sh
docker  build  -t  weekly_report-online:v1.0.0 ../
```





## 构建 Web 镜像

提示：Web 镜像构建可选，非必须；



### 获取 Dockerfile

```
git clone https://github.com/Kry1702/weekly-report-docker.git
```



### 进入工作目录

```
cd weekly-report-docker/Dockerfiile/weekly-report-web
```



### 更换登录信息

提示：更换登录账号信息，该步骤可选；

#### 安装依赖工具

```
yum -y install httpd-tools
```



#### 删除旧认证文件

```
rm -f ./nginx/.htpasswd
```



#### 生成新认证文件

```
htpasswd -c ./nginx/.htpasswd User
```

注意：

User：表示需要设置的用户；

连续两次密码，完成设置；



### 构建镜像

```
docker build -t  weekly_report-web:v1.0.0 ../
```





# 应用



## 基于 CentOS  运行

### 安装 Docker-compose

```
curl -L https://get.daocloud.io/docker/compose/releases/download/1.29.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```



### 获取代码

```
git clone https://github.com/guaguaguaxia/weekly_report.git
```



#### 进入工作目录

```
cd weekly-report-docker
```



#### 启动服务

```
docker-compoes up -d 
```

注意：

运行之前需要修改环境变量"OPENAI_API_KEY" ；必须！**重要**！

weekly-report 默认镜像以离线构建，镜像稍大；

Web 默认映射端口：8080 ，可自定义修改；



#### 访问

http://IP:8080

默认账号：admin

默认密码：123123.a
