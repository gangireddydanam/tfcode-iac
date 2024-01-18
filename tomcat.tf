#to create ec2 
#ami 
#instance type 
#pem 
#security group (vpc)
#tags 
#zone/subnet 
#userdata

#resources we crate 

#resources already exist 
#region 
#zone 
#ami 

#pem
# resource "aws_key_pair" "tomcat" {
#   key_name   = "tomcat-tf"
#   public_key = file("id_rsa.pub")
# }

data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.3.20240108.0-kernel-6.1-x86_64*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical

}


resource "aws_security_group" "tomcat" {
  name        = "tomcat"
  description = "Allow TLS inbound traffic and all outbound traffic"
  # ingress = [  ]
  # egress = [  ]
  tags = {
    Name = "tomcat"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.tomcat.id
  cidr_ipv4         = "49.205.32.171/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.tomcat.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.tomcat.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.tomcat.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon.id
  instance_type = "m5.2xlarge"
  # key_name = "simple"
  key_name = aws_key_pair.tomcat.key_name
  vpc_security_group_ids = [aws_security_group.tomcat.id]
  user_data = file("tomcat_userdata.sh")

  tags = {
    Name      = "HelloWorld"
    Team      = "Devops"
    Manual    = "false"
    Terraform = "true"
  }
}



