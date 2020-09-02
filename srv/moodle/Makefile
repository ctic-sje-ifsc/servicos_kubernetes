all: delete create

delete:
	kubectl delete -f moodle.yaml
	kubectl delete -f Secret.yaml


create:
	kubectl create -f Secret.yaml
	kubectl create -f moodle.yaml
