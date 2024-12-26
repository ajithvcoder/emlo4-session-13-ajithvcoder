docker build -t fastapi_infer -f ./Dockerfile . --no-cache


docker run -it -e PORT=8000 -p 8000:8000 -v /workspaces/ajithvcoder/container:/workspace/ fastapi_infer bash

docker run -e PORT=5000 -p 5000:5000 myapp

uvicorn app:app --host 0.0.0.0 --port ${PORT:-8000}

minikube ---

alias kubectl="minikube kubectl --"

minikube start

kubectl get all -n kube-system

docker build -t fastapi-classifier-k8s -f ./Dockerfile . --no-cache

testing docker-
docker run -it -v /workspaces/classifier:/workspace -e PORT=8000 -p 8000:8000  fastapi-classifier-k8s bash

building in minikube env

eval $(minikube docker-env)
docker run -it -v /workspaces/classifier:/workspace -e PORT=8000 -p 8000:8000  fastapi-classifier-k8s bash

docker run -it -e PORT=8000 -p 8000:8000  fastapi-classifier-k8s:latest

docker run -d -e PORT=8000 -p 8000:8000  fastapi-classifier-k8s:latest

forwarding port
kubectl port-forward service/classifier-service 8000:80

docker run -d -v /workspaces/classifier:/workspace classifier-k8s

learnings rember the systems docker images are different from the kubernetes docker images
so use `eval $(minikube docker-env)` to get inside kubernetes docker images and do docker images then
to exit it use `eval $(minikube docker-env -u)` 