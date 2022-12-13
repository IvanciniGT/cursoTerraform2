# Qué es un proveedor en Terraform?

Es un programa, invocable por terraform,
que hablará con un EXTERNO para solicitarle recursos:
- Su creación
- Modificación
- Eliminación


Script Terraform ---> terraform ---> provider ----> docker
 .tf
 
 Esos programas, los encontramos en el terraform registry
 
 
 
Script Terraform ---> terraform ---> provider ----> aws cli ---> AWS.com
 .tf
 
# El comando terraform

Me permite aplciar operaciones sobre un script:

- init          Descargar los proveedores
- validate      Valida la sintaxis dell script
- plan          Calcula los pasos que serán requeridos 
                para conseguir el estado deseado de la infra
- apply         Aplica un plan:
                    Creando     \
                    Borrando     >  Aquellos recursos que sea necesario
                    Modificando /
- destroy       Desmantela TODA la infra

# Propiedades de los recursos

## Tipos de datos que maneja Terraform

- String        Cadena de caratetes : "texto"
- Number        Número : 12
- Bool          Valor lógico: false | true
- List(...)     Es un listado de datos ORDENADOS
                Se puede acceder alos items por su posición
                [ 1,2,3 ]
- Set(...)      Es un listado de datos DESORDENADO
                Solo puedo iterar sobre los items
                No hay sintaxis para definirlo
- Map(...)      Es un diccionario, Tabla hash, array asociativo:
                Conjunto clave-valor de elementos
                { clave = valor , clave2 = valor2 }
- Block         ESTO SON RAROS
                Como si fueran mapas... pero con 2 salvedades... Más bien con 1.


- Objects


