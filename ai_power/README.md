# 一键部署 Minikube 环境和项目
## 1. 安装 Docker, Minikube 和 kubectl
## 2. 给服务器上传 CA 证书
将以下 CA 证书文件上传到服务器：
- `server.crt`（证书文件）
- `server.key`（密钥文件）
可以使用 `scp` 命令上传
## 3. 设置环境变量
在服务器上配置以下环境变量：
- `POSTGRES_USER`：数据库用户名
- `POSTGRES_PASSWORD`：数据库密码
- `AI_POWER_RAILS_MASTER_KEY`：ai_power_demo项目的`rails_master_key`
- `FILE_CENTER_RAILS_MASTER_KEY`：file_center项目的`rails_master_key`
- `MAXKB_API_KEY`：maxkb的api_key
- `CA_CERT_PATH`：CA的`server.crt`文件路径
- `CA_KEY_PATH`：CA的`server.key`文件路径
设置完记得执行 source ~/.bashrc
## 4. 启动minikube
minikube start --docker-env HTTP_PROXY=http://host.docker.internal:7890 --docker-env HTTPS_PROXY=http://host.docker.internal:7890 --docker-env NO_PROXY=127.0.0.1,192.168.49.0/24

注：其中http://host.docker.internal:7890是代理服务器地址
## 5.初始化
bash setup.sh