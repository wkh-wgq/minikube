#!/bin/bash

# 定义别名
alias kubectl="minikube kubectl --"
shopt -s expand_aliases

# 创建namespace
kubectl create namespace dev
# 设置当前上下文的namespace为dev
kubectl config set-context --current --namespace=dev

cd config

# 应用配置文件
kubectl apply -f maxkb_pvc.yaml \
  -f maxkb_python_pvc.yaml \
  -f maxkb_deployment.yaml \
  -f maxkb_service.yaml \

echo "maxkb setup completed."