provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1a"
}

resource "aws_instance" "example" {
  ami           = "ami-014b38e758721be30"
  instance_type = "t2.micro"
}
