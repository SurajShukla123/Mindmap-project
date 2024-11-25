Deployment Steps:

Build and push Docker images:

docker build -t my-app:latest .
docker tag my-app:latest <ECR_URI>:latest
docker push <ECR_URI>:latest


Apply Kubernetes manifests:

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
Verify application status:

kubectl get pods
kubectl get svc
Post-Deployment Validation
Access the application using the Load Balancer URL:
kubectl get svc
Monitor logs:
kubectl logs -f <pod-name>
Rollback
If the deployment fails, redeploy the previous image:

kubectl set image deployment/my-app my-app=<ECR_URI>:previous-tag






