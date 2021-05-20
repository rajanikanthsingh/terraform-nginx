data "template_file" "userdata" {
  template = file("${path.module}/template/userdata.sh")
}


resource "aws_instance" "ec2_instance" {
  ami                         = var.EC2.AMIS
  instance_type               = var.EC2.AWS_INSTANCE_TYPE
  subnet_id                   = var.SUBNET_ID
  security_groups             = var.instance-security-group-id
  key_name                    = var.EC2.KEYPAIR_NAME
  associate_public_ip_address = var.EC2.ASSOCIATE_PUBLIC_IP_ADDRESS
  user_data                   = data.template_file.userdata.rendered
  root_block_device {
    delete_on_termination = true
    volume_size           = "10"
  }
  tags = {
    "Name" = "${var.EC2.NAME}-${terraform.workspace}"
  }
}