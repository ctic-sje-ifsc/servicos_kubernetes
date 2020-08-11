all: delete create

delete:
	kubectl delete -f bareos-smtpd.yaml
	kubectl delete -f bareos-webui.yaml
	kubectl delete -f bareos-sd.yaml
	kubectl delete -f bareos-fd.yaml
	kubectl delete -f bareos-dir.yaml
	kubectl delete -f bareos-db.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f bareos-db.yaml
	kubectl create -f bareos-dir.yaml
	kubectl create -f bareos-fd.yaml
	kubectl create -f bareos-sd.yaml
	kubectl create -f bareos-webui.yaml
	kubectl create -f bareos-smtpd.yaml
