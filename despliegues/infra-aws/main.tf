resource "aws_instance" "miservidor"{
    tags            = {
                        Name = "servidor-${var.nombre}"
                    }
    ami             = data.aws_ami.miami.image_id
    key_name        = aws_key_pair.miclave_en_aws.key_name # #"clave-publica-de-${var.nombre}" # Esto sería una cagada de proporciones EPICAS !
                                                       # Funcionaría ?
                                                        # No lo se... puede que si... puede que no... 
                                                        # Qué va a crear primero terraform? 
                                                        # El servidor o las claves? Ni idea
    instance_type   = "t2.micro"
    security_groups = [ aws_security_group.grupo_seguridad.name ]

    # Test
    # ping
    provisioner "local-exec" {
        command = "sleep 20 && ping -c 1 ${self.public_ip}"
    }
    
    # conexión por ssh
    connection {
        type    = "ssh"
        host    = self.public_ip
        port    = 22
        user    = "ubuntu"
        private_key = module.misclaves.keys.privatekey.pem
    }
    provisioner "remote-exec" {
        inline = [ "echo EUREKA" ]
    }
}

resource "aws_key_pair" "miclave_en_aws" {
    key_name   = "clave-publica-de-${var.nombre}"
    public_key = module.misclaves.keys.publickey.openssh
}

module "misclaves" {
    source = "../modulo"
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

resource "aws_security_group" "grupo_seguridad" {
  name = "reglas-${var.nombre}"
  description = "Permitir todo"
  vpc_id      = null 

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "reglas-${var.nombre}"
  }
}
