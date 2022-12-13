resource "docker_container" "micontenedor" {
    name        = "minginx"
    image       = docker_image.miimagen.image_id # Referencio a otro recurso
    cpu_shares  = 2048
    env         = [ "VARIABLE1=VALOR1", "VARIABLE2=VALOR2"]
    ports {
        internal    = 80
        external    = 8080
        ip          = "127.0.0.1"
    }
    ports {
        internal    = 443
        external    = 8444
        ip          = "172.31.44.24"
    }
}

resource "docker_image" "miimagen" {
    name = "nginx:latest"
}
