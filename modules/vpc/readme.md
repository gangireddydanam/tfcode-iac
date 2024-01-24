steps for vpc
1. create vpc (10.2.0.0/16)
2. create subnets (9 subnets-each zone wise)
-=------------------------------------------
app-subnet--10k--30k--cidr range /18 -48-
app-subnet1 - 10.2.0.0/18---10.2.63.254
app-subnet2 -10.2.64.0/18---10.2.127.254
app-subnet3 -10.2.128.0/18-10.2.191.254


data-subnet -8k-24k--cidr range - /21- 6
-=------------------------------------------
data-subnet1 - 10.2.192.0/21---10.2.199.254
data-subnet2 -10.2.200.0/21---10.2.207.254
data-subnet3 -10.2.208.0/21-10.2.215.254


public-subnet-256-1k--cidr range- /24 - 1k
-=------------------------------------------
public-subnet1 - 10.2.216.0/24---10.2.216.254
public-subnet2 -10.2.217.0/24---10.2.217.254
public-subnet3 -10.2.218.0/24-10.2.218.254