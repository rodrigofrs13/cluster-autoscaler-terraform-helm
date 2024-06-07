# resource "helm_release" "cluster_autoscaler" {
#   name       = "cluster-autoscaler"
#   repository = "https://kubernetes.github.io/autoscaler"
#   chart      = "cluster-autoscaler"
#   namespace  = "kube-system"
#   timeout    = 300
#   version = "9.34.1"

#   values = [
#     "${file("cluster_autoscaler_values.yaml")}"
#   ]

#   set {
#     name  = "autoDiscovery.clusterName"
#     value = data.aws_eks_cluster.cluster.name
#   }

#   set {
#     name  = "awsRegion"
#     value = var.region
#   }

#   set {
#     name  = "rbac.serviceAccount.create"
#     value = "false"
#   }

#   set {
#     name  = "rbac.serviceAccount.name"
#     value = "cluster-autoscaler"
#   }

# }




