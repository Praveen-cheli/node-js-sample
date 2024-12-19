module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name               = "eks-vpc"
  cidr               = "10.0.0.0/16"
  azs                = ["ap-south-1a"]
  public_subnets     = ["10.0.1.0/24"]
  private_subnets    = ["10.0.2.0/24"]
  enable_nat_gateway = true
}

# EKS Cluster without Node Groups
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "mumbai-eks-cluster"
  cluster_version = "1.27"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  # Node group configuration has been removed
}

# Outputs for EKS Cluster
output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}
