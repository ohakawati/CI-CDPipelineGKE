apiVersion: apps/v1
kind: Deployment
metadata:
  name: ac-cluster
  labels:
    app: ac-cluster
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ac-cluster
  template:
    metadata:
      labels:
        app: ac-cluster
    spec:
      containers:
      - name: ac-cluster
        image: us-central1-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/ac_repository/ac-cluster:COMMIT_SHA
        ports:
        - containerPort: 3000
---
kind: Service
apiVersion: v1
metadata:
  name: ac-cluster
spec:
  selector:
    app: ac-cluster
  ports:
  - protocol: TCP
    port: 80
    targetPort: 3000
  type: LoadBalancer