# simple-app-k3s-dotnetcore3
Simple Application requires 5 steps.
1. Clone your fork of this repository locally.
2. Configure the correct kubeconfig by replacing your ~/.kube/config with the config from rancher.
    - test by doing a `kubectl get all -A`
3. customize the name of your app and ingress hostname.
    - kubernetes/deployment.yaml
    - kubernetes/service.yaml
    - kubernetes/ingress.yaml
    - Dockerfile
    - Makefile
5. Set your namespace to illumina
6. make build (build our .net app in docker) and tag the image.
    - Make sure you do docker login to login to docker.io.
7. publish image to docker hub.
8. deploy manifests to kubernetes.
9. browse to your ingress hostname.