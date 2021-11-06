
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${var.domain}-cluster"
  cluster_version = "1.20"
  subnets         = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t3.xlarge"
      additional_userdata           = "echo foo bar"
#      asg_desired_capacity          = 1
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    }
#    {
#      name                          = "worker-group-2"
#      instance_type                 = "t2.large"
#      additional_userdata           = "echo foo bar"
#      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
#      asg_desired_capacity          = 1
#    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}


data "external" "thumbprint" {
  program = [
    "bash",
    "${path.module}/kluster.open-id.sh",
    var.region,
  ]
}

#resource "aws_iam_openid_connect_provider" "this" {
#  url = data.aws_eks_cluster.cluster[0]["oidc"][0]["issuer"]
#  client_id_list = [
#    "sts.amazonaws.com",
#  ]
#  thumbprint_list = [
#    data.external.thumbprint.result.thumbprint,
#  ]
#
#  depends_on = [
#    data.aws_eks_cluster.cluster
#  ]
#}