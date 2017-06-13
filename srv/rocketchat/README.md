#Rocket.Chat on Kubernetes

    README still under redaction

As of now High-Availability is not available, only one instance of each component is launched.
Using MongoDB with replica sets is a bit tricky to implement in Docker so it has not been in the scope of this project yet.

    The database currently use the **emptyDir** volume directive, if you want data persistence across node migration you should change it accordingly, like to use block storage endpoint.

The deployment is pretty straight-forward, clone the repo first.

```bash
$ git clone https://github.com/BastienM/rocketchat-kubernetes.git
$ cd rocketchat-kubernetes
```

Edit **app-deployment.yaml** and **app-ingress.yaml**  to replace **chat.example.com** with your own domain.

And as SSL encryption is enabled by default you must provide your certificat and key in **app-secrets.yaml**

```bash
$ cat /path/to/crt | base64
# then past it into data.tls.crt

$ cat /path/to/key | base64
# then past it into data.tls.key
```

Then you can start deploying the pods.

```bash
$ kubectl create -f database-service.yaml
$ kubectl create -f database-deployment.yaml
$ kubectl create -f app-secrets.yaml
$ kubectl create -f app-service.yaml
$ kubectl create -f app-deployment.yaml
$ kubectl create -f ingress-deployment.yaml
$ kubectl create -f app-ingress.yaml
```

The ingress controller act like a internal frontend proxy for the pods, so to access the application you must first find on which node it is running.

```bash
$ kubectl get po -o wide
```

And to test if everything is working all right.

```bash
$ curl --resolve chat.example.com:443:<node-ip> https://chat.example.com
```
