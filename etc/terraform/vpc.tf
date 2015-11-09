# VPCの基本設計

## VPC

### VPCのCIDR
variable "vpc_cidr" {}
### リソース定義
resource "aws_vpc" "vpc_main" {
    cidr_block = "${var.vpc_cidr}"
    tags {
        Name = "vpc-${var.system_name}-${var.vpc_environment}"
        System = "${var.system_name}"
        Environment = "${var.vpc_environment}"
    }
}
