# Provisionadores

Son acciones que podemos ejecutar:
- Al crear o modificar un recurso
- Al eliminarlo

# En terraform solo hay 3 tipos de provisionadores
- local-exec        Nos permite ejecutar un comando / script en el host donde lanzamos terraform
                    - Smoke test? Prueba de humo? prueba muy simple para asegurarme que algo funciona.
                        ping: La maquina arrancada y pinchada en red
- remote-exec       Nos permite ejecutar un comando / script en el recurso que estamos provisionando
                    script: 
                    - Instalar MariaDB? No lo haré.... Esto lo hará ansible
                    - Editar una configuración? No.... Esto lo hará ansible
                    - Dejar todo preparado para que Ansible/Puppet/Chef/Salt pueda ejecutarse aquí dentro
                    - Smoke test? Prueba de humo? prueba muy simple para asegurarme que algo funciona.
                        conexión por ssh para ejecutar: echo EUREKA !!!! Me piro a por mi cocoloco !!!!
- file              Nos permite copiar/crear archivos en el recurso que estamos provisionando


Para ejecutar Ansible:
- python 2.7    3.6
- ssh:
    - usuario
    - puerto: 22 (estará abierto en el firewwall?)
    - clave ssh?

---

Al programar, no tiramos código en ficheros tal cual.... lo organizamos

funciones, métodos, procedimientos

funcion salidas NOMBRE(entradas)

En terraform a esas funciones las llamamos MODULOS 

# modulo es un conjunto de:
- Recursos
- Variables
- Outputs
- Proveedores

# script es un conjunto de:
- Recursos
- Variables
- Outputs
- Proveedores
- Configuracion de un proveedor
