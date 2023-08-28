udp-pod-k8s
===========

Build client with:
```
make client
```

Create cluster with at least 2 nodes.

Start server with:
```
kubectl apply -f udpserver.yaml
```

Find pod and current node IP with:
```
kubectl get pods -owide -l=app=udpserver
kubectl get nodes -owide
```

Create DNS entry with current IP (with TTL 60) and start client (in a new terminal)
```
./client udpserver.example.com
```

Kill pod, get new IP and update DNS
```
kubectl delete pods <podname> --wait=false
kubectl get pods -owide -l=app=udpserver
kubectl get nodes -owide
```

Wait for 2 minutes and check if client failed in the other terminal. Kill with Ctrl+C

Credits
-------

Quickly built based on:
- [Golang UDP Server and Client Example](https://www.golinuxcloud.com/golang-udp-server-client/)
- [Explore Termination Behavior for Pods And Their Endpoints](https://kubernetes.io/docs/tutorials/services/pods-and-endpoint-termination-flow/)
