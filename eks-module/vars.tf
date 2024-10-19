variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "service_ipv4_cidr" {
  type = string
}

variable "cluster_tag_name" {
  type = string
}

variable "iam_role_name" {
  type = string
}

variable "cluster_sg_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "cluster_sg_tags" {
  type = list(string)
}

variable "ip_protocol" {
  type = string
}

variable "cidr_ipv4" {
  type = string
}

variable "cidr_ipv6" {
  type = string
}

variable "node_group_name" {
  type = string
}

variable "asg_desired_size" {
  type = number
}

variable "asg_max_size" {
  type = number
}

variable "asg_min_size" {
  type = number
}

variable "asg_max_unavailable" {
  type = number
}

variable "workers_iam_role_name" {
  type = string
}

variable "ec2_types" {
  type = list(string)
}

variable "ec2_pricing_type" {
  type = string
}