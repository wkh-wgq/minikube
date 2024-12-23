1.先安装docker,minikube和kubectl
2.给服务器上传ca证书(server.crt和server.key)
3.设置环境变量
  POSTGRES_USER(db用户名)
  POSTGRES_PASSWORD(db密码)
  AI_POWER_RAILS_MASTER_KEY(ai_power_demo项目的rails_master_key)
  FILE_CENTER_RAILS_MASTER_KEY(file_center项目的rails_master_key)
  MAXKB_API_KEY(maxkb的api_key)
  CA_CERT_PATH(ca的server.crt文件路径)
  CA_KEY_PATH(ca的server.key文件路径)
4.启动
  minikube start --docker-env HTTP_PROXY=http://host.docker.internal:7890 --docker-env HTTPS_PROXY=http://host.docker.internal:7890 --docker-env NO_PROXY=127.0.0.1,192.168.49.0/24

  注：其中http://host.docker.internal:7890是代理服务器地址
5.初始化
  bash setup.sh