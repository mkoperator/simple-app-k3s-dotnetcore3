# simple-app-k3s-dotnetcore3

## Training Day 1
Simple Application requires following these steps.
1. Clone your fork of this repository locally.
2. Configure the correct kubeconfig by replacing your ~/.kube/config with the config from rancher.
    - test by doing a `kubectl get all -A`
3. customize the name of your app and ingress hostname. (edit Makefile then run `make customize`)
    - kubernetes/deployment.yaml
    - kubernetes/service.yaml
    - kubernetes/ingress.yaml
5. Set your namespace to illumina
6. Build our .net app in docker and tag the image. (run `make build`)
    - Make sure you do docker login to login to docker.io.
7. publish image to docker hub. (run `make publish`)
8. deploy manifests to kubernetes. (run `make deploy`)
9. browse to your ingress hostname.

## Training Day 2
Part two. Deploy a helm chart.
1. create a default chart directory (make charts)
    `helm create charts`
2. overwrite values by using set while deploying to cluster (make deploycharts)
    `helm install ... --set`
3. browse to your ingress hostname.
4. delete using `helm delete` (make removecharts)
