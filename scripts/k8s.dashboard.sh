# Configure kubectl context with aws eks cluster
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
