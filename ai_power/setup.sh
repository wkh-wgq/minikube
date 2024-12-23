#!/bin/bash

# 创建namespace
kubectl create namespace dev
# 设置当前上下文的namespace为dev
kubectl config set-context --current --namespace=dev

# 创建postgre的密码密钥
kubectl create secret generic postgres-secret \
  --from-literal=POSTGRES_USER=$POSTGRES_USER \
  --from-literal=POSTGRES_PASSWORD=$POSTGRES_PASSWORD
# 创建ai-power的密码密钥
kubectl create secret generic ai-power-secret \
  --from-literal=RAILS_MASTER_KEY=$AI_POWER_RAILS_MASTER_KEY \
  --from-literal=MAXKB_API_KEY=$MAXKB_API_KEY
# 创建file-center的密码密钥
kubectl create secret generic file-center-secret \
  --from-literal=RAILS_MASTER_KEY=$FILE_CENTER_RAILS_MASTER_KEY
# 创建ssl证书
kubectl create secret tls ssl-secret \
  --key=$CA_KEY_PATH \
  --cert=$CA_CERT_PATH

cd config

# 应用配置文件
kubectl apply -f postgres_pvc.yaml \
  -f postgres_deployment.yaml \
  -f postgres_service.yaml \
  -f maxkb_pvc.yaml \
  -f maxkb_python_pvc.yaml \
  -f maxkb_deployment.yaml \
  -f maxkb_service.yaml \
  -f file_center_deployment.yaml \
  -f file_center_service.yaml \
  -f audio_recognition_deployment.yaml \
  -f audio_recognition_service.yaml \
  -f ai_power_config.yaml \
  -f ai_power_deployment.yaml \
  -f ai_power_service.yaml \
  -f nginx_config.yaml \
  -f nginx_deployment.yaml \
  -f nginx_service.yaml \

echo "ai_power setup completed."