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

# Variables en terraform

Nos permiten parametrizar un script

De cada variable tendré que definir una serie de datos:
- Nombre
- Descripción
- Tipo de datos que puede albergar
- Valor por defecto

# Cómo puedo suministrar valores a una variable en TERRAFORM

- A través de un fichero .auto.tfvars
    Se cargan por defecto... con prioridad muy baja
- En un fichero de variables que suministraré al comando terraform mediante el
  argumento --var-file.
    Esos ficheros de variables llevarán extensión .tfvars
- A través de la terminal suministrando un argumento --var VARIABLE=valor
    Nos gusta esto? NO. Por qué? ES COMO LA LEJIA ESTRELLA !!!!
                                 No deja ni huella !
    Esto solo lo usamos en un escenario: 
                                 CUANDO NO QUIERA DEJAR HUELLA !
                                 para suministrar una credencial!
- Poniendo un valor por defecto al declarar la variable
- En ningún sitio: Terraform pregunta por consola
    Nunca... A tomar por culo la automatización !
    TERRAFORMM NUNCA SE EJECUTA CON UNA VARIABLE DESASIGNADA !

# PRIORIDAD DE LOS VALORES DE VARIABLES

- Los suministrados mediante el argumento --var
- Los suministrados mediante el argumento --var-file
- Los de los ficheros .auto.tfvars
- Los por defecto del variables.tf
- Si no, se piden interactivamente