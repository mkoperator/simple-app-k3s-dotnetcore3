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

charts:
	helm create charts

deploycharts:
	helm install ${MYNAME}-app2 charts \
	--set image.repository=${MYDOCKERUSER}/${MYNAME}-app-dotnet \
	--set image.tag=${IMAGETAG} \
	--set ingress.enabled=true \
	--set "ingress.hosts[0].host=${MYNAME}2.rancher.simpleblocks.net" \
	--set "ingress.hosts[0].paths[0]=/"

removecharts:
	helm delete ${MYNAME}-app2
