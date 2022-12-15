# Tipos de datos:

- string
- number
- boolean
- list(x)
- set(x)
- map(x)
- object


block

# Comandos de terraform

- init          Descarga los providers (y algo más que ya nos enteraremos llegado el caso!: modulos)
- validate
- refresh       Actualiza el .tfstate preguntando al(os) providers
- plan          Comparando el "estado real" del entorno con el estado deseado para ese entorno
                                .tfstate
- apply         Aplica el plan:
                        - Creando
                        - Borrando
                        - Modificando
- destroy       Borra todo

- output
 
# Dar valores a las variables

- En la linea de comandos mediante el argumento --var VARNAME=value
    NO SE USA MUCHO... salvo que no quisieramos dejar huella 
- En un fichero que lleva extensión .tfvars y lo suministramos mediante el argumento --var-file
- Ficheros .auto.tfvars que se cargan en automático << AQUI DAMOS LOS VALORES POR DEFECTO
- Mediante valores por defecto al definir la variable  <<< Lo usaremos solo en UN escenario que añun no conocemos.
- Interactivamente... RUINA ! se carga cualquier automatización

Si dado el caso, una variable queda DESASIGNADA terraform ABORTA !