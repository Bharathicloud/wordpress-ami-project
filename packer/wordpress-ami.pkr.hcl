"builders": [
  {
    "type": "amazon-ebs",
    "region": "us-east-1",
    "source_ami_filter": {
      "filters": {
        "virtualization-type": "hvm",
        "name": "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250305*",
        "root-device-type": "ebs"
      },
      "owners": ["609320953544"],
      "most_recent": true
    },
    "instance_type": "t2.micro",
    "ssh_username": "ubuntu",
    "ami_name": "wordpress-ami-{{timestamp}}",
    "ami_description": "WordPress AMI built with Ansible",
    "tags": {
      "Name": "wordpress-ami",
      "App": "CMS",
      "Environment": "test"
    },
    "ami_users": [],
    "associate_public_ip_address": true,
    "key_pair_name": "bharathi.ppk"
  }
]
