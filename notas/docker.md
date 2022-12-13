$ docker [TIPO_OBJETO] [VERBO] <args>

TIPO_OBJETO = container image
VERBOS = list rm inspect 
    image = pull 
    container = create start stop logs

docker image     pull   mariadb:10.9.4      # Descarga de la imagen de contenedor

docker container create \
        --name mimariadb \
        -e MARIADB_DATABASE=midb \
        -e MARIADB_USER=usuario \
        -e MARIADB_PASSWORD=password \
        -e MARIADB_ROOT_PASSWORD=password \
        mariadb:10.9.4           # Crear un contenedor

docker image pull nginx:latest

docker container create --name minginx -p IP_HOST:PUERTO_HOST:PUERTO_CONTENEDOR nginx:latest
                                          127.0.0.1:8080:80
                                          8080:80

# Interfaces de red en una computadora:

- Loopback  127.0.0.1    - localhost
- eth       172.31.44.24
- docker    172.17.0.1


    ---------------------------------------------Red amazon---------------------------------------------
    |                                                               |
    172.31.44.24 :8080                                            ??????
    |               v                                                |
    IvanPC          v                                                MenchuPC
    |               v
    172.17.0.1      v
    |               v
    RedDocker       v
    |               v
    172.17.0.2:80  <<
    | 
    Contenedor nginx