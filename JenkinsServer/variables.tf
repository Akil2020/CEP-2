variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instances"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}
variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t3.medium"
}
variable "key_name" {
  description = "The name of the EC2 key pair to associate with the instances"
  type        = string
  default     = "access_ec2"
}
