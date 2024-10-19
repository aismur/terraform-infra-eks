module "project-x-eks-cluster" {
  source                = "../../eks-module"
# eks cluster
  cluster_name          = var.cluster_name
  cluster_version       = var.cluster_version
  subnet_ids            = var.subnet_ids
  service_ipv4_cidr     = var.service_ipv4_cidr
  cluster_tag_name      = var.cluster_tag_name
  iam_role_name         = var.iam_role_name
  cluster_sg_name       = var.cluster_sg_name
  vpc_id                = var.vpc_id
  cluster_sg_tags       = var.cluster_sg_tags
  ip_protocol           = var.ip_protocol
  cidr_ipv4             = var.cidr_ipv4
  cidr_ipv6             = var.cidr_ipv6
# worker nodes
  node_group_name       = var.node_group_name
  asg_desired_size      = var.asg_desired_size
  asg_max_size          = var.asg_max_size
  asg_min_size          = var.asg_min_size
  asg_max_unavailable   = var.asg_max_unavailable
  workers_iam_role_name = var.workers_iam_role_name
  ec2_types             = var.ec2_types
  ec2_pricing_type      = var.ec2_pricing_type
}

