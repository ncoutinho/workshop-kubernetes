#!/bin/bash
docker-compose build
cd terraform && terraform apply
gcloud container clusters get-credentials potato
kubectl --namespace=kube-system get pods
