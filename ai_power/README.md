# 通过minikube快速部署ai_power项目
## 1.安装 Docker, Minikube 和 kubectl
  minikube的安装可以参考[官网](https://minikube.kubernetes.ac.cn/docs/start/)，其中也有kubectl安装的教程
## 2.给服务器上传 CA 证书
将以下 CA 证书文件上传到服务器：
- `server.crt`（证书文件）
- `server.key`（密钥文件）

可以使用 `scp` 命令上传
## 3.启动minikube
```
  minikube start --docker-env HTTP_PROXY=http://host.docker.internal:7890 \
    --docker-env HTTPS_PROXY=http://host.docker.internal:7890 \
    --docker-env NO_PROXY=127.0.0.1,192.168.49.0/24
```

**注**：其中`http://host.docker.internal:7890`是代理服务器地址，由于是docker启动，所以只能用`host.docker.internal`
## 4.配置alias简化使用流程
在`~/.bashrc`文件中配置`alias kubectl="minikube kubectl --"`

设置完记得执行 `source ~/.bashrc`
## 5.部署maxkb
`bash maxkb_setup.sh`
## 6.查看集群状态
先启用插件 `minikube addons enable metrics-server`

打开dashboard面板 `minikube dashboard`
## 7.打开隧道
`minikube tunnel --bind-address=0.0.0.0`

这里绑定`0.0.0.0`，局域网内都可以访问
## 8.获取maxkb的apikey
登陆maxkb(`127.0.0.1:8080`)，初始用户名`admin`，密码`MaxKB@123..`，配置模型，配置应用，获取应用的apikey
## 9.设置环境变量
在服务器上配置以下环境变量：
- `POSTGRES_USER`：数据库用户名
- `POSTGRES_PASSWORD`：数据库密码
- `AI_POWER_RAILS_MASTER_KEY`：ai_power_demo项目的`rails_master_key`
- `FILE_CENTER_RAILS_MASTER_KEY`：file_center项目的`rails_master_key`
- `MAXKB_API_KEY`：maxkb的`api_key`
- `CA_CERT_PATH`：CA的`server.crt`文件路径
- `CA_KEY_PATH`：CA的`server.key`文件路径

设置完记得执行 `source ~/.bashrc`
## 10.初始化
`bash setup.sh`
## 11.绑定hosts
在`/etc/hosts`文件中添加本机ip到`sws.local`的映射
## 12.页面访问
pod都run起来后就可以访问网址`https://sws.local/ai_power_api`查看页面了