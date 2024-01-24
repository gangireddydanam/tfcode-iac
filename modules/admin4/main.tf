module "prod" {
  count            = var.vpc_create ? 1 : 0
  source           = "../vpc"
  vpc_cidr         = "10.1.0.0/16"
  vpc_name         = "prod"
  pub_subnet_cidr  = ["10.1.216.0/24", "10.1.217.0/24", "10.1.218.0/24"]
  app_subnet_cidr  = ["10.1.0.0/18", "10.1.64.0/18", "10.1.128.0/18"]
  data_subnet_cidr = ["10.1.192.0/21", "10.1.200.0/21", "10.1.208.0/21"]

}
