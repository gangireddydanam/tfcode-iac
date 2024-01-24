#create ec2 

#ami 
#type 
#security group
#pem file
#ebs volume 
#userdata 

#get with data block of vpcid
# data "aws_vpc" "default" {
#   default = "true"
# }

resource "aws_instance" "nginx" {
  ami = "ami-0d3f444bc76de0a79"
  #   ami           = data.aws_ami.amazon.id 
  #   instance_type = "t2.micro"
  instance_type = var.instance_type
  count         = 1 
  #   key_name = "apache-tf"
  key_name               = var.publickey
  vpc_security_group_ids = [aws_security_group.nginx.id] 
  user_data              = file("nginx.sh")
  depends_on             = [aws_security_group.nginx]
  tags = {
    Name = "nginx"
  }
}


resource "aws_security_group" "nginx" {
  name        = "nginx"
  description = "Allow inbound traffic and all outbound traffic for nginx"
  vpc_id      = "vpc-06a4e9a233196c1f4"
  #   vpc_id      = data.aws_vpc.id 

  tags = {
    Name = "nginx"
  }
}

resource "aws_vpc_security_group_ingress_rule" "inbound_ssh" {
  security_group_id = aws_security_group.nginx.id
  cidr_ipv4         = "49.205.36.85/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "inbound_http" {
  security_group_id = aws_security_group.nginx.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "outbound_nginx_ipv4" {
  security_group_id = aws_security_group.nginx.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "outbound_nginx_ipv6" {
  security_group_id = aws_security_group.nginx.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# data "aws_ami" "amazon" {
#     filters {}
# }

#ouptputs 




