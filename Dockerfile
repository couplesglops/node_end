FROM index.docker.io/beevelop/cordova:latest 
MAINTAINER      Dongasai "1514582970@qq.com"

# 安装基础环境和常用程序
RUN apt update
RUN apt install -y vim dos2unix
WORKDIR /home/
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
RUN cnpm install -g yarn
# 安装依赖
COPY package.json /home/app/
WORKDIR /home/app/
RUN cnpm install
# 安装依赖完成

# 进行文件复制和环境变量初始化
COPY . /home/app/
WORKDIR /home/app/
CMD npm run start


