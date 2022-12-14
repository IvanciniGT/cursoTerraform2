variable "cuota_cpu" {
    type        = number    # string number bool list(number) set(xxx) map(xxx) object()
    description = "Couta de CPU que puede usar el contenedor (en base 1024)"
    #default     = 1024 # NUNCA SE PONEN VALORES POR DEFECTO EN LOS SCRIPTS !
                         # JAMAS !
                         # Y entonces? para que está esto? YA LO DESCUBRIREIS ;)
    nullable    = true # false...que es el valor por defecto
    validation {
        # Expresion lógica que de devolver TRUE se entiende que el dato es OK
        condition       = var.cuota_cpu == null ? true : var.cuota_cpu > 0
        # Mensaje que se mostrará en caso que la condición devuelva FALSE
        error_message   = "La cuota de la CPU debe ser mayor que cero... despistaill@ !"
    }
}

variable "nombre_contenedor" {
    type        = string
    description = "Nombre del contenedor a crear"
    validation {
        # Expresion lógica que de devolver TRUE se entiende que el dato es OK
        condition       = length(regexall("^[a-z][a-z0-9.]{5,20}$", var.nombre_contenedor)) == 1
        # Mensaje que se mostrará en caso que la condición devuelva FALSE
        error_message   = "El nombre del servidor solo debe incluir letras en minúscula, números y si acaso, puntos. Y debe empezar con letras."
    }
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

variable "variables_entorno" {
    # type        = set(string)   # MIERDA GIGANTE !
        # Aquí hay un comportamiento mágico.
        # POR DIOS Y POR LA VIRGEN SIEMPRE EXPLICITO !!!!!
    type        = map(string)
    description = "Variables de entorno"
}

variable "puertos_a_exponer" {
    type        = list(object({
                                    interno = number
                                    externo = number
                                    ip      = optional(string, "0.0.0.0")
                              }))
    description = "Puertos a exponer del contenedor"
}