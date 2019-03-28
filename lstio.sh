kubectl apply -f istio-1.0.6/install/kubernetes/helm/helm-service-account.yaml
helm init --service-account tiller
helm install istio-1.0.6/install/kubernetes/helm/istio --name istio --namespace istio-system
helm upgrade --recreate-pods --namespace istio-system --set grafana.enabled=true istio istio-1.0.6/install/kubernetes/helm/istio
kubectl port-forward -n istio-system svc/grafana 3000:3000