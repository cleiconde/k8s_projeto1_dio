#!/bin/bash

echo -e "\nCriando as imagens...\n"

docker image build -t cleiconde/projeto-backend:1.0 backend/.
docker image build -t cleiconde/projeto-database:1.0 database/.

echo -e "\nRealizando o push das imagens...\n"

docker push cleiconde/projeto-backend:1.0
docker push cleiconde/projeto-database:1.0

echo -e "\nCriando serviços no cluster Kubernetes...\n"

kubectl apply -f ./services.yml

echo -e "\nRealizando o deploy...\n"

kubectl apply -f ./deployment.yml