variable "cuota_cpu" {
    type        = number    # string number bool list(number) set(xxx) map(xxx) object()
    description = "Couta de CPU que puede usar el contenedor (en base 1024)"
    #default     = 1024 # NUNCA SE PONEN VALORES POR DEFECTO EN LOS SCRIPTS !
                         # JAMAS !
                         # Y entonces? para que está esto? YA LO DESCUBRIREIS ;)
}
variable "nombre_contenedor" {
    type        = string
    description = "Nombre del contenedor a crear"
}

#variable "imagen" { # Es una cochinada !
#    type        = string
#    description = "Imagen a usar para crear el contenedor"
#}

variable "imagen_repo" {
    type        = string
    description = "Repo de donde sacar la imagen del contenedor"
}

variable "imagen_version" {
    type        = string
    description = "Versión de la imagen del contenedor"
}

variable "variables_entorno" {   # MIERDA GIGANTE !
    type        = set(string)
    description = "Versión de la imagen del contenedor"
}
# Aquí hay un comportamiento mágico.
# POR DIOS Y POR LA VIRGEN SIEMPRE EXPLICITO !!!!!