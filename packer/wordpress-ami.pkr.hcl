packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "wordpress" {
  ami_name      = "wordpress-ami"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "ami-0c55b159cbfafe1f0"
  ssh_username  = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.wordpress"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2 php php-mysql mysql-server",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2",
      "wget https://wordpress.org/latest.tar.gz",
      "tar -xvzf latest.tar.gz",
      "sudo mv wordpress /var/www/html/",
      "sudo chown -R www-data:www-data /var/www/html/wordpress",
      "sudo chmod -R 755 /var/www/html/wordpress"
    ]
  }
}
