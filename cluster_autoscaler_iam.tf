# # Criação da política IAM para o Cluster Autoscaler
# resource "aws_iam_policy" "cluster_autoscaler_policy" {
#   name        = "ClusterAutoscalerPolicy"
#   description = "Policy for Kubernetes Cluster Autoscaler"
#   policy      = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Action = [
#           "autoscaling:DescribeAutoScalingGroups",
#           "autoscaling:DescribeAutoScalingInstances",
#           "autoscaling:DescribeLaunchConfigurations",
#           "autoscaling:DescribeTags",
#           "autoscaling:SetDesiredCapacity",
#           "autoscaling:TerminateInstanceInAutoScalingGroup",
#           "ec2:DescribeInstances",
#           "ec2:DescribeLaunchTemplateVersions",
#           "ec2:DescribeTags"
#         ],
#         Resource = "*"
#       }
#     ]
#   })
# }



# resource "aws_iam_role" "cluster_autoscaler" {
#   name = "eks-cluster-autoscaler-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Principal = {
#           Federated = "arn:aws:iam::246732148991:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/7245F203A29B4E5F8B0282F829F4FBDC"
#          },
#         Action = "sts:AssumeRoleWithWebIdentity",
#         Condition = {
#           StringEquals = {
#             "oidc.eks.${var.region}.amazonaws.com/id/7245F203A29B4E5F8B0282F829F4FBDC:aud" = "sts.amazonaws.com"
#             "oidc.eks.${var.region}.amazonaws.com/id/7245F203A29B4E5F8B0282F829F4FBDC:sub" = "system:serviceaccount:kube-system:cluster-autoscaler"
#           }
#         }
#       },
#     ],
#   })
# }

# resource "kubernetes_service_account" "cluster_autoscaler" {
#   metadata {
#     name      = "cluster-autoscaler"
#     namespace = "kube-system"
#     annotations = {
#       "eks.amazonaws.com/role-arn" = aws_iam_role.cluster_autoscaler.arn
#     }
#   }
# }

# resource "aws_iam_role_policy_attachment" "cluster_autoscaler_policy_attachment" {
#   policy_arn = aws_iam_policy.cluster_autoscaler_policy.arn
#   role       = aws_iam_role.cluster_autoscaler.name
# }

# # (Opcional) Se você estiver usando uma instância EC2 para executar o Cluster Autoscaler, crie um profile para a instância
# resource "aws_iam_instance_profile" "cluster_autoscaler_instance_profile" {
#   name = "ClusterAutoscalerInstanceProfile"
#   role = aws_iam_role.cluster_autoscaler.name
# }
