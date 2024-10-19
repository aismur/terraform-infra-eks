#cluster
cluster_name          = "project-x-dev"
cluster_version       = "1.29"
subnet_ids            = ["subnet-01564e4a061c8a1f0", "subnet-074f9c2c0bc4c38c2"]
service_ipv4_cidr     = "10.100.0.0/16"
cluster_tag_name      = "project-x"
iam_role_name         = "project-x-dev-eks-iam-role"
cluster_sg_name       = "EKS Cluster Security Group"
vpc_id                = "vpc-012f8db737e09251b"
cluster_sg_tags       = ["eks-cluster-sg", "owned", "project-x-dev"]
ip_protocol           = "-1"
cidr_ipv4             = "0.0.0.0/0"
cidr_ipv6             = "::/0"

#worker nodes
node_group_name       = "worker_nodes_group"
asg_desired_size      = 2
asg_max_size          = 3
asg_min_size          = 1
asg_max_unavailable   = 1
workers_iam_role_name = "workers_iam_role"
ec2_types              = ["t3.medium", "t2.medium"]
ec2_pricing_type      = "SPOT"
