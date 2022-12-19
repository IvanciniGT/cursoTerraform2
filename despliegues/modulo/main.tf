locals {
    directorio_claves                       = endswith( var.keys_path, "/" ) ? var.keys_path : "${var.keys_path}/"

    fichero_clave_privada_pem               = "${local.directorio_claves}privateKey.pem"
    fichero_clave_privada_openssh           = "${local.directorio_claves}privateKey.openssh"
    fichero_clave_publica_pem               = "${local.directorio_claves}publicKey.pem"
    fichero_clave_publica_openssh           = "${local.directorio_claves}publicKey.openssh"
    
    existe_fichero_clave_privada_pem        = fileexists( local.fichero_clave_privada_pem       ) 
    existe_fichero_clave_privada_openssh    = fileexists( local.fichero_clave_privada_openssh   ) 
    existe_fichero_clave_publica_pem        = fileexists( local.fichero_clave_publica_pem       ) 
    existe_fichero_clave_publica_openssh    = fileexists( local.fichero_clave_publica_openssh   ) 

    existen_los_ficheros_claves             = ( local.existe_fichero_clave_privada_pem        &&
                                                local.existe_fichero_clave_privada_openssh    &&
                                                local.existe_fichero_clave_publica_pem        &&
                                                local.existe_fichero_clave_publica_openssh )
}

# Uno para generar la clave ... Siempre? Quizás No...
resource "tls_private_key" "claves" {

    count       = ! local.existen_los_ficheros_claves || var.force_generate ? 1 : 0

    algorithm   = var.algorithm.name
    ecdsa_curve = var.algorithm.name == "ECDSA" ? var.algorithm.config : null
    rsa_bits    = var.algorithm.name == "RSA"   ? var.algorithm.config : null
    
    provisioner "local-exec" {
        command = <<EOT
                        mkdir -p ${local.directorio_claves}
                        echo "${self.private_key_pem}"     > ${local.fichero_clave_privada_pem}
                        echo "${self.private_key_openssh}" > ${local.fichero_clave_privada_openssh}
                        echo "${self.public_key_pem}"      > ${local.fichero_clave_publica_pem}
                        echo "${self.public_key_openssh}"  > ${local.fichero_clave_publica_openssh}
                    EOT
    }
}
