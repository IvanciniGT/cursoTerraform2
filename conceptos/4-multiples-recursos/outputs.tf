  
output "direcciones_ip" {
    value = [ for contenedor in docker_container.micontenedor: 
                contenedor.network_data[0].ip_address ]
}

output "direcciones_ip_como_texto" {
    value = join("\n",[ for contenedor in docker_container.micontenedor: 
                "${contenedor.name}=${contenedor.network_data[0].ip_address}" ])
}

output "direccion_aplicacion" {
    value = (var.numero_contenedores == 1 ? 
                docker_container.micontenedor[0].network_data[0].ip_address :
                docker_container.balanceador_de_carga[0].network_data[0].ip_address)
}


output "direcciones_ip_contenedores_personalizados" {
    value = [ for nombre_contenedor, contenedor in docker_container.mis_contenedores_personalizados: 
                contenedor.network_data[0].ip_address ]
}
