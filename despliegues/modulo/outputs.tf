output "keys" {
    value = 
            length(tls_private_key.claves) == 0 ? {
                    privatekey = {
                                    pem     = file( local.fichero_clave_privada_pem       ) 
                                    openssh = file( local.fichero_clave_privada_openssh   ) 
                                 }
                    publickey  = {
                                    pem     = file( local.fichero_clave_publica_pem       ) 
                                    openssh = file( local.fichero_clave_publica_openssh   ) 
                                 }
                } : {
                    privatekey = {
                                    pem     = tls_private_key.claves[0].private_key_pem
                                    openssh = tls_private_key.claves[0].private_key_openssh
                                 }
                    publickey  = {
                                    pem     = tls_private_key.claves[0].public_key_pem
                                    openssh = tls_private_key.claves[0].public_key_openssh
                                 }
                }
}

# keys.publickey.pem
# keys.publickey.openssh
# keys.privatekey.pem
# keys.privatekey.openssh
