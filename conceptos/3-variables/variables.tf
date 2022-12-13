variable "cuota_cpu" {
    type        = number    # string number bool list(number) set(xxx) map(xxx) object()
    description = "Couta de CPU que puede usar el contenedor (en base 1024)"
    #default     = 1024 # NUNCA SE PONEN VALORES POR DEFECTO EN LOS SCRIPTS !
                         # JAMAS !
                         # Y entonces? para que está esto? YA LO DESCUBRIREIS ;)
}
