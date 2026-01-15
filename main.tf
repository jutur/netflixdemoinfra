provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-07ff62358b87c7116"
  instance_type          = "t2.nano"
  key_name               = "jutur123"
  vpc_security_group_ids = ["sg-020987ed241447a42"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["Ansible", "tomcat-1", "tomcat-2"]
}
