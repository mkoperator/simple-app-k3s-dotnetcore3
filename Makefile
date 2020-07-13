MYNAME="mikhail"
MYDOCKERUSERNAME="thecrazyrussian"
customize:
	cat "kubernetes/templates/deployment.yaml.template" | sed "s/{{MYNAME}}/$MYNAME/g" > kubernetes/deployment.yaml


build:
	docker build . --tag thecrazyrussian/simple-app-dotnet:2

publish:
	docker push thecrazyrussian/simple-app-dotnet:2

deploy:
	kubectl apply -f kubernetes/deployment.yaml
	kubectl apply -f kubernetes/service.yaml
	kubectl apply -f kubernetes/ingress.yaml