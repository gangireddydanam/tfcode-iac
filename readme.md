This repo used to create resources in aws with tf

security group
ec2 
keypair 

terraform init
terraform plan ---terraform validate ---terrraform fmt 
terraform apply 

why are we using terraform / what is tf ?
IaC 
create resources 
you can resuse
tf --diff providers 
declarative hashicorp 
avoid console updates/creation 
reduce time 


which block i can use to create resources ?
resource "aws_instance" "apache"{
instance_type = 
ami = 
datasource=
securitygroup=
keypair=
subnet

}

terraform {


}



terraform lifecycle ?
init/plan / apply 

what init does ?
it downloads plugins/terraform block

terraform {
requried_version = "~>1.6.0"
required_provider={
    aws 
}  
}










i wanted to create security group with tf ?
resource "aws_security_group" "sg"{
name = "apache"
ingress ={
    port=80
    source=[0.0.0.0/0]
}
egress = {
 port = -1
 source = [0.0.0.0/0]


}

}

in terraform ever

ec2 properties 
publicip/privateip/subnet/vpc/zone/instance-id---Attributes 
Interpolation 

output "publicip" {
    description="print ip"
    value= aws_instance.apache.public_ip
}


*.tf
-----------
resource {}
data {}
output{}
terraform {}
provider {}






terraform.exe plan -var istance_type=t2.micro