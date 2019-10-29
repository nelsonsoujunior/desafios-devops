#!/bin/bash

echo "build da imagem"

docker build -t appnode .

echo "cria arquivo de acesso ingress, deployments e service"

kubectl create -f svc.appnode.yaml ; kubectl create -f dpl.appnode.yaml ; kubectl create -f svc.appnode.yaml

echo "verifica ip da aplicação"

kubectl get svc
