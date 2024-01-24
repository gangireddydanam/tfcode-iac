module "stage" {
  source           = "../vpc"
  vpc_cidr         = "10.0.0.0/16"
  vpc_name         = "stage"
  pub_subnet_cidr  = ["10.0.216.0/24", "10.0.217.0/24", "10.0.218.0/24"]
  app_subnet_cidr  = ["10.0.0.0/18", "10.0.64.0/18", "10.0.128.0/18"]
  data_subnet_cidr = ["10.0.192.0/21", "10.0.200.0/21", "10.0.208.0/21"]

}
