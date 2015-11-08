/*
 * OpsWorks Service Role
 */
resource "aws_iam_role" "iam_role_opsworks_service_role" {
    name = "opsworks-service-role-${var.system_name}"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "opsworks.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "iam_role_policy_opsworks_service_role_polocy" {
    name = "opsworks-service-role-${var.system_name}-polocy"
    role = "${aws_iam_role.iam_role_opsworks_service_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "iam:PassRole",
        "cloudwatch:GetMetricStatistics",
        "cloudwatch:DescribeAlarms",
        "ecs:*",
        "elasticloadbalancing:*",
        "rds:*"
      ],
      "Resource": ["*"],
      "Effect": "Allow"
    }
  ]
}
EOF
}


/*
 * OpsWorks Instance Profile
 */
resource "aws_iam_role" "iam_role_opsworks_ec2_role" {
    name = "opsworks-ec2-role"
    path = "/"
    assume_role_policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal":{
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow"
      }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "iam_instance_profile_opsworks_ec2_role" {
  name = "opsworks-ec2-role"
  roles = ["${aws_iam_role.iam_role_opsworks_ec2_role.name}"]
}
