resource "aws_internet_gateway" "igw-vpc-main" {
    vpc_id = "${aws_vpc.vpc_main.id}"
    tags {
        Name = "igw-vpc-main-${var.system_name}"
    }
}

