all: delete create

delete:
	kubectl delete -f sharelatex-service.yaml
	kubectl delete -f sharelatex-deployment.yaml
	kubectl delete -f redis-service.yaml
	kubectl delete -f redis-deployment.yaml
	kubectl delete -f mongo-service.yaml
	kubectl delete -f mongo-deployment.yaml
	kubectl delete -f PersistentVolume.yaml
	kubectl delete -f PersistentVolumeClaim.yaml

create:
	kubectl create -f PersistentVolumeClaim.yaml
	kubectl create -f PersistentVolume.yaml
	kubectl create -f mongo-deployment.yaml
	kubectl create -f mongo-service.yaml
	kubectl create -f redis-deployment.yaml
	kubectl create -f redis-service.yaml
	kubectl create -f sharelatex-deployment.yaml		
	kubectl create -f sharelatex-service.yaml
	
	
	
	
