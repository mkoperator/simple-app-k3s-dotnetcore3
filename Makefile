MYNAME="mikhail"
MYDOCKERUSER="thecrazyrussian"
IMAGETAG=1
customize:
	mkdir -p kubernetes
	cat "templates/deployment.yaml.template" | sed "s/{{MYNAME}}/${MYNAME}/g; s/{{MYDOCKERUSER}}/${MYDOCKERUSER}/g; s/{{IMAGETAG}}/${IMAGETAG}/g" > kubernetes/deployment.yaml
	cat "templates/ingress.yaml.template" | sed "s/{{MYNAME}}/${MYNAME}/g" > kubernetes/ingress.yaml
	cat "templates/service.yaml.template" | sed "s/{{MYNAME}}/${MYNAME}/g" > kubernetes/service.yaml
build:
	docker build . --tag ${MYDOCKERUSER}/${MYNAME}-app-dotnet:${IMAGETAG}

publish:
	docker push ${MYDOCKERUSER}/${MYNAME}-app-dotnet:${IMAGETAG}

deploy:
	kubectl apply -f kubernetes/deployment.yaml
	kubectl apply -f kubernetes/service.yaml
	kubectl apply -f kubernetes/ingress.yaml
	@echo "Your application should be available at https://${MYNAME}.rancher.simpleblocks.net."