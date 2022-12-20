resource "aws_instance" "miservidor"{
    tags = {
        Name = "servidor-${var.nombre}"
    }
    ami = data.aws_ami.miami.image_id

    instance_type = "t2.micro"
}

# Propietario de la imagen: CANONICAL : 099720109477
# t2.micro lleva virtualizacion hvm y procesador amd64
# Virtualización: hvm
# ubuntu-focal-20.04-amd64-server

data "aws_ami" "miami" {
  most_recent      = true
  owners           = ["099720109477"]

  filter {
    name   = "name"
    values = ["*ubuntu-focal-20.04-amd64-server*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}