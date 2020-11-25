all: delete create

delete:
	kubectl delete -f mediawiki.yaml
	kubectl delete -f Secrets.yaml

create:
	kubectl create -f Secrets.yaml
	kubectl create -f mediawiki.yaml
