resource "aws_instance" "miservidor"{
    # nombre
    tags = {
        Name = "servidor-${var.nombre}"
    }
    # ami
    ami = "ami-00463ddd1036a8eb6"
    # tipo
    instance_type = "t2.micro"
}
