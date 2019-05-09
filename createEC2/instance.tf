provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1a"
}

resource "aws_instance" "example" {
  ami           = "ami-090261cf76befafc8"
  instance_type = "t2.micro"
}
