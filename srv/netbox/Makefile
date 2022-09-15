all: delete create

delete:
	kubectl delete -f netbox.yaml --insecure-skip-tls-verify
	kubectl delete -f Secret.yaml --insecure-skip-tls-verify

create:
	kubectl create -f Secret.yaml --insecure-skip-tls-verify
	kubectl create -f netbox.yaml --insecure-skip-tls-verify
