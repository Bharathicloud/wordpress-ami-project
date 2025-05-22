packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250305"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["609320953544"]
  }
  ssh_username = "ubuntu"
}

build {
  name    = "wordpress-ami"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}
