# Route Table
resource "aws_route_table" "rtb_public_vpc_main" {
    vpc_id = "${aws_vpc.vpc_main.id}"
  
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw_vpc_main.id}"
    }

    tags {
        Name = "rtb-public-vpc-main-${var.system_name}"
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

