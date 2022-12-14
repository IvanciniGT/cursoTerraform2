# Esto es sencillo... aunque con una funcionalidad limitada...
# En función del caso concreto de uso, me servirá o no !
variable "numero_contenedores" {
    type        = number
    description = "Numero de contenedores a crear"
    validation {
        condition       = var.numero_contenedores > 0 && var.numero_contenedores <= 20
        error_message   = "Debe establecer entre 1 y 20 contenedores"
    }
}
variable "contenedores_personalizados" {
    type        = map(number)
    description = "Contenedores personalizados a crear"
}
