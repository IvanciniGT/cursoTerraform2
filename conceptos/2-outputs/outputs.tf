# Los outputs los podemos recuperar con el comando:
# $ terraform output            # Lista todos los outputs
# $ terraform output  [--json | --raw]   direccion_ip        
output "direccion_ip" {
    # UPS... ha sido deprecated value = docker_container.micontenedor.ip_address
    value = docker_container.micontenedor.network_data[0].ip_address
                                            # network_data es una lista. Saco el PRIMER network_data
}

# $ terraform output devuelve formato HCL