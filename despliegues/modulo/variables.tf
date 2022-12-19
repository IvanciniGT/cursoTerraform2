variable "force_generate" {
    description = ""
    type        = bool
    nullable    = false
    default     = false     # Por dios nunca destructivo !
}
variable "keys_path" {
    description = ""
    type        = string
    nullable    = false
    default     = "./claves"
    
    validation {
        condition       = length(regexall("^(((([.]{1,2}[\\/])|[\\/])?(([a-zA-Z0-9_-]+[\\/]?)*))|[.]{1,2})$"))==1
        error_message   = "El path no tiene un estructura válida"
    }
}
variable "algorithm" {
    description = ""
    type        = object({
                    name    = string
                    config  = optional(string, null)
                  })
    nullable    = false
    default     = {
                        name    = "RSA"
                        config  = 2048 # Terraform nos hará la conversión a texto, él solito ! QUE GUAY !
                    }
    # Uno de los 3 algoritmos permitidos
    # Para cada uno, una configuración válida
    validation {
        condition       = contains( ["RSA", "ECDSA", "ED25519"], var.algorithm.name )
        error_message   = "El nombre del algoritmo debe ser: RSA, ECDSA o ED25519"
    }
    # RSA
    validation {
        condition       = ( var.algorithm.name != "RSA" ? true : 
                             ! can(to_number(var.algorithm.config)) ? false :
                             to_number(var.algorithm.config) > 0 ) 
        error_message   = "El nombre del algoritmo debe ser: RSA, ECDSA o ED25519"
    }
    # ECDSA
    validation {
        condition       = ( var.algorithm.name != "ECDSA" ? true : 
                            contains( ["P224", "P256", "P384", "P521"] , var.algorithm.config ) )
        error_message   = "Para el algoritmo ECDSA, la configuración debe ser uno de los valores: P224, P256, P384, P521"
    }
    # ED25519
    validation {
        condition       = ( var.algorithm.name != "ED25519" ? true : 
                            var.algorithm.config == null )
        error_message   = "No debe suministrarse configruaciónpara el algoritmo ED25519"
    }
}