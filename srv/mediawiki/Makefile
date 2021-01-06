all: delete create

delete:
	kubectl delete -f mediawiki.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f mediawiki.yaml
