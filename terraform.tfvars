## Dados do cluster
cluster_name                            = "workshop-autoscaler"
eks_version                             = "1.30"
region                                  = "us-east-1"
cluster_endpoint_public_access_cidrs    = ["0.0.0.0/0"]
cluster_enabled_log_types               = ["api", "audit", "authenticator","controllerManager","scheduler"]

## VPC
cidr                                    = "10.0.0.0/16"
enable_nat_gateway                      = "true"
single_nat_gateway                      = "true"
enable_dns_hostnames                    = "true"

## Add-ons - https://docs.aws.amazon.com/eks/latest/userguide/managing-add-ons.html
version_kube_proxy                      = "v1.29.0-eksbuild.1"
version_coredns                         = "v1.11.1-eksbuild.4"
version_vpc-cni                         = "v1.16.0-eksbuild.1"

