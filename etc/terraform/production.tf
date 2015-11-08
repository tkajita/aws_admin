# VPCの基本設計

variable "vpc_environment" {
    default = "production"
}

## VPC

### VPCのCIDR
variable "vpc_cidr" {}
### リソース定義
resource "aws_vpc" "vpc_main" {
    cidr_block = "${var.vpc_cidr}"
    tags {
        Name = "vpc-main-${var.system_name}-${var.vpc_environment}-az-a"
        System = "${var.system_name}"
        Environment = "${var.vpc_environment}"
    }
}


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
