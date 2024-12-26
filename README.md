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
https://drive.google.com/file/d/1HHSFrklRPpoHGlggmBkUSjSg4tCrNANY/view?usp=sharing

gdown 1HHSFrklRPpoHGlggmBkUSjSg4tCrNANY


Instructions to
### Start MiniKube

alias kubectl="minikube kubectl --"
minikube start
kubectl get all -n kube-system

### Create the Deployment

pre deployment test
docker build -t fastapi-classifier-k8s -f ./Dockerfile . --no-cache

docker run -it  -e PORT=8000 -p 8000:8000  fastapi-classifier-k8s bash

*Note if you are mounting the folder for debugging then you need to download mambaout_model.onnx again as i am downloading the model only inside docker and reducing the size of repo*
docker run -it -v /workspaces/emlo4-session-13-ajithvcoder:/workspace -e PORT=8000 -p 8000:8000  fastapi-classifier-k8s bash

uvicorn app:app --host 0.0.0.0 --port 8000

After success proceed below

eval $(minikube docker-env)
docker build -t fastapi-classifier-k8s -f ./Dockerfile . --no-cache
eval $(minikube docker-env -u)

kubectl apply -f .

kubectl get pods

kubectl port-forward service/classifier-service 8000:80

### Tunnel to the Ingress

Only in your local machine only not in EC2

configure in classifier-ingress.yaml also `host: ajith.fastapi`

- If you are using wsl for ubuntu for windows do below. if you are in linux or windows follow any one of below one

In wsl
```
/etc/hosts

127.0.0.1       ajith.fastapi  localhost
```

also u need to modify in windows

- Open `C:\Windows\System32\drivers\etc\hosts` in administrator mode

```

127.0.0.1       ajith.fastapi  localhost
```

Tunnel setup

- minikube service classifier-service
- minikube tunnel

- kubectl apply -f .

- `http://ajith.fastapi/` will work now in your local


### Access the FastAPI docs page
(screenshot)

minikube dashboard (screenshot)

Serving app screenshot with pod name

prediction screenshot


### Other outputs

kubectl describe <your_deployment>
kubectl describe <your_pod>
kubectl describe <your_ingress>
kubectl top pod
kubectl top node
kubectl get all -o yaml
