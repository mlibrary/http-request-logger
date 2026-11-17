It writes details about every request it receives to stdout.

```yaml
apiVersion: "apps/v1"
kind: "Deployment"
metadata:
  name: "http-request-logger"
spec:
  replicas: 1
  selector:
    matchLabels:
      app: "http-request-logger"
  template:
    metadata:
      labels:
        app: "http-request-logger"
    spec:
      containers:
      - name: "http-request-logger"
        image: "ghcr.io/mlibrary/http-request-logger:latest"
        ports:
        - name: "http"
          containerPort: 4567
---
apiVersion: "v1"
kind: "Service"
metadata:
  name: "http-request-logger"
spec:
  ports:
  - name: "http"
    targetPort: 4567
    port: 80
  selector:
    app: "http-request-logger"
```

And then you can talk to `http://http-request-logger:80` from within
the namespace.
