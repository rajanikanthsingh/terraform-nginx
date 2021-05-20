AWS_REGION    = "us-west-2"
VPC_CIDR      = "10.0.0.0/16"
PUBLIC_SUBNET = ["10.0.1.0/24", "10.0.2.0/24"]


EC2 = {
  ec2-1 = {
    AWS_INSTANCE_TYPE           = "t2.micro"
    KEYPAIR_NAME                = "raja"
    AMIS                        = "ami-03d5c68bab01f3496"
    ASSOCIATE_PUBLIC_IP_ADDRESS = true
    NAME                        = "1st"
  },
  ec2-2 = {
    AWS_INSTANCE_TYPE           = "t2.micro"
    KEYPAIR_NAME                = "raja"
    AMIS                        = "ami-03d5c68bab01f3496"
    ASSOCIATE_PUBLIC_IP_ADDRESS = true
    NAME                        = "2nd"
  }
}