# FROM node:20
# WORKDIR /app
# COPY . .
# RUN npm config set registry https://registry.npmmirror.com
# RUN npm install
# EXPOSE 3000
# CMD ["npm", "start"]

FROM node:20
WORKDIR /app
# 先复制包管理文件
COPY package*.json ./
# 设置镜像源并安装依赖
RUN npm config set registry https://registry.npmmirror.com && \
    npm install
# 最后复制所有源代码
COPY . .
EXPOSE 3000
CMD ["npm","start"]