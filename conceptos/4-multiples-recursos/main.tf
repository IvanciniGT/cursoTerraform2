resource "docker_container" "micontenedor" {
    name        = "minginx"
    image       = docker_image.miimagen.image_id # Referencio a otro recurso
    
    ports {
        internal    = 80
        external    = 8080
        ip          = "127.0.0.1"
    }

}

resource "docker_image" "miimagen" {
    name = "nginx:latest"
}
