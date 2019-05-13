variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-014b38e758721be30"
    us-west-2 = "ami-xxxx"
    eu-west-1 = "ami-yyyy"
  }
}
