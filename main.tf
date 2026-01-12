provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-059afa9e3a9c7af0c"
  instance_type          = "t2.micro"
  key_name               = "jutur123"
  vpc_security_group_ids = ["sg-020987ed241447a42"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
