# ---------------
# EC2
# ----------------
locals {
  example_instance_type = "t2.micro"
}

resource "aws_instance" "example" {
    ami = "ami-079a2a9ac6ed876fc"
    instance_type = local.example_instance_type
    subnet_id = aws_subnet.example_subnet.id
    vpc_security_group_ids = [
        aws_security_group.web.id,
        aws_security_group.ssh.id
        ]
    tags = {
        Name = "example"
    }
    user_data = file("./files/user_data.sh")
}

output "example_public_dns" {
    value = aws_instance.example.public_dns
}