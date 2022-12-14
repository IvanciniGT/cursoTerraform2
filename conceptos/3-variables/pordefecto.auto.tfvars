# Aquí defino los valores por defecto!

cuota_cpu           = 512
nombre_contenedor   = "minginx1.prod.es"
imagen_repo         = "nginx"
imagen_version      = "latest"
variables_entorno   = {
                            "DEBUG"    = "FALSE"
                            "LANGUAGE" = "es_ES"
                      }
puertos_a_exponer   = [
                        {
                            interno = 80
                            externo = 8080
                            ip      = "127.0.0.1"
                        },
                        {
                            interno = 443
                            externo = 8443
                        }
                      ]
