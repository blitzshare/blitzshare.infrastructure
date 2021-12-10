helm repo add traefik https://helm.traefik.io/traefik
helm repo update
helm upgrade --install --create-namespace --namespace traefik-ns traefik traefik/traefik -f ./k8s/traefik.values.yml
helm upgrade --install --namespace traefik traefik-common 