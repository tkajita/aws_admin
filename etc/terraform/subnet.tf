# Subnetの設計

## Subnet for Availability Zone#A

### Availability Zone A 側SubnetのCIDR
variable "subnet_a_cidr" {}
### リソース定義
resource "aws_subnet" "subnet_main_az_a" {
    vpc_id = "${aws_vpc.vpc_main.id}"
    cidr_block = "${var.subnet_a_cidr}"
    availability_zone = "ap-northeast-1a"
    tags {
        Name = "subnet-${var.system_name}-${var.vpc_environment}-az-a"
        System = "${var.system_name}"
        Environment = "${var.vpc_environment}"
    }
}

## Subnet for Availability Zone#C

### Availability Zone C 側SubnetのCIDR
variable "subnet_c_cidr" {}
### リソース定義
resource "aws_subnet" "subnet_main_az_c" {
    vpc_id = "${aws_vpc.vpc_main.id}"
    cidr_block = "${var.subnet_c_cidr}"
    availability_zone = "ap-northeast-1c"
    tags {
        Name = "subnet-${var.system_name}-${var.vpc_environment}-az-c"
        System = "${var.system_name}"
        Environment = "${var.vpc_environment}"
    }
}

## Internet Gateway
resource "aws_internet_gateway" "igw_vpc_main" {
    vpc_id = "${aws_vpc.vpc_main.id}"
    tags {
        Name = "igw-vpc-${var.system_name}-${var.vpc_environment}"
        System = "${var.system_name}"
        Environment = "${var.vpc_environment}"
    }
}


## Route Table
resource "aws_route_table" "rtb_public_vpc_main" {
    vpc_id = "${aws_vpc.vpc_main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw_vpc_main.id}"
    }

    tags {
        Name = "rtb-public-vpc-${var.system_name}-${var.vpc_environment}"
        System = "${var.system_name}"
        Environment = "${var.vpc_environment}"
    }
}

resource "aws_route_table_association" "rtb_public_vpc_main_assoc_subnet_main_az_a" {
    subnet_id = "${aws_subnet.subnet_main_az_a.id}"
    route_table_id = "${aws_route_table.rtb_public_vpc_main.id}"
}

resource "aws_route_table_association" "rtb_public_vpc_main_assoc_subnet_main_az_c" {
    subnet_id = "${aws_subnet.subnet_main_az_c.id}"
    route_table_id = "${aws_route_table.rtb_public_vpc_main.id}"
}
