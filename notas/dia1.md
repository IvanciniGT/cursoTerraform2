# Terraform

Es una herramienta de software creada por una empresa llamada HashiCorp (Vagrant), que nos ofrece:
- Un lenguaje declarativo, llamado HCL (HashiCorp Language)
- Un intérprete con el que ejecutar comandos sobre scripts que vamos a crear con ese lenguaje HCL.

Uso:
- Para gestionar (adquirir/liberar/mantener) recursos que contrataremos/adquiriremos en un proveedor.

| Recursos          | Proveedores                           |
| ----------------- | ------------------------------------- |
| Servidor virtual  | Cloud                                 |
| BBDD              | Cluster de kubernetes                 |
| Entrada de dns    | Servidor de DNS                       |
| Usuario           | Identity provider (Active directory)  |
| Par de claves SSH | ?                                     |

## Cloud

Conjunto de servicios (relacionados con el mundo TIC) que una empresa X ofrece a través de internet:
- Pago por uso
- Se ofrecen de forma desatendida / automatizada / Sin mediación humana

Clouds más importantes
- AWS   - Amazon
- AZURE - Microsoft
- GCP   - Google

Los servicios que ofrecen los clouds habitualmente los dividimos en 3 grupos:
- Servicios de Infraestructura (almacenamiento, cómputo, comunicaciones) IaaS
- Servicios de plataforma (base de datos, cluster de Kubernetes, Openshift) PaaS
- Servicios de Software (cloud9) SaaS

### Los clouds a día de hoy son importantes?

#### Entornos de producción

- Alta disponibilidad
    "Intentar" garantizar un determinado tiempo de servicio, pactado contractualmente.
        90% = RUINA = 36,5 dias al año con el sistema off   |   €
        99% = BUENO =  3,6 dias al año con el sistema off   |   €€
        99,9%  =       8 horas al año                       |   €€€€€€
        99,99% =      20 minutos                            v   €€€€€€€€€€€€€€€€€€
        
        REDUNDANCIA
    Intentar garantizar la NO PERDIDA de información: x3 (RAID5)

- Escalabilidad
  Capacidad de ajustar la infraestructura a las necesidades de cada momento
    
    App3: INTERNET !
        Dia n:         100 usuarios
        Dia n+1:   1000000 usuarios         Escalabilidad vertical:     Más máquina !
        Dia n+2:     10000 usuarios         Escalabilidad horizontal:   Más máquinaS ! ****
        Dia n+2:  10000000 usuarios

# El lenguaje HCL

Es un lenguaje declarativo.

Los lenguajes (lenguajes humanos-naturales includos) podemos usarlos de varias formas:
- La silla está debajo de la ventaja.       Afimativa
- La silla no está debajo de la ventaja.    Negativa
- Está la silla debajo de la ventaja?       Interrogativa
- Pon la silla debajo de la ventana         Imperativa
- Quiero una silla debajo de la ventana     Desiderativa ~ Uso declarativo

Scripts: Secuencia de comandos que queremos que una computadora ejecute.
- bash / sh     |
- ps1  / bat    |   Imperativa      (LOS ODIAMOS !!!!, cada día más)
- python        /
- azure cli | aws cli : Quiero montar una infra en AWS / AZURE

Ejemplo de script:
        - Imperativo: Felipe, 
            IF NOT silla:
                Felipe, al IKEA a por una silla 
            IF NOT hay hueco debajo de la ventana:
                HAZ HUECO !
            IF no hay silla debajo de la ventana:
                pon la silla debajo de la ventana!
        
        - Declarativo: Felipe:
            Quiero una sila debajo de la ventana
            
Ansible, Puppet, Kubernetes, Openshift, Terraform ~> Idempotencia

### Idempotencia?

    Da igual el estado inicial del sistema, tras ejecutar el script, el sistema siempre 
    debe quedar de la misma forma


# DEVOPS: 

Cultura de la automatización de todo lo que hay entre el desarrollo y la operación de un sistema informático

## CI: Integración continua
    
    Cuando tengo automatizado el despliegue y pruebas de la últiva versión del software de cada momento en el 
    Entorno de Integración

## CD: Entrega continua
    
    Si pongo la última versión de mi software de forma automatizada en manos del usuario final 
    
## CD: Despliegue continuo
    
    Si instalo la última versión de mi software de forma automatizada en el entorno 
    de producción de mi usuario final. 

Hoy en día, los entornos de integración son de USAR Y TIRAR ! Que siempre esté limpio!

Jenkins o similar   -> Terraform  -(1)-> Ansible, Puppet
                    (2)-> Ansible, Puppet

El (1) no lo haríamos ni de coña !!!!!! Por qué? NO QUIERO UN SISTEMA FUERTEMENTE ACOPLADO !


# Scripts de terraform

Lo que escribimos es una especia de CATALOGO DE RECURSOS! => Infraestructura como código (VERSIONADO)

Un script de terraform NO ES UN ARCHIVO, NI DE COÑA !!!!
Un script de terraform es UNA CARPETA , que tiene dentro 1 o más archivos escritos con sintaxis HCL... y que
deben tener por nombre el que ME DE LA REAL GANA ! y extensión: .tf

Tradicionalmente se llaman:
- main.tf
- variables.tf
- outputs.tf
- versions.tf

En esos archivos, esribimos bloques de código en sintaxis HCL.
Hay unos pocos de tipos de bloques básicos:
√ terraform     Nos permite definir los proveedores que vamos a usar                MARTES
√ provider      Dar la configuración concreta de un proveedor                       MARTES
√ resource      Definir un recurso que quiero gestionar por un proveedor concreto   MARTES, MIERCOLES
    - provisioners
√ output        Información que quiero obtener de vuelta de los recursos            MARTES
√ variable      PARAMETRIZAR los scripts     ** LO MAS COMPLEJO DE TERRAFORM        MARTES, MIERCOLES, JUEVES
√ locals        Otro tipo de "variables"... de uso interno                          JUEVES
- data                                                                              JUEVES
√ module        Son una especie de funciones, que agrupan la creación de unos recursos                                                                     JUEVES


jugar con clouds

---

# CONTENEDORIZACION     HOY !!!!

## Contenedor

> Es un entorno aislado dentro de un SO Linux donde ejecutar procesos.

AISLADO?
- Tiene su propia configuración de red: su propia IP
- Tiene sus propias variables de entorno
- Tiene sus propio sistema de archivos
- Puede tener limitación de acceso a los recursos del hierro

Los contenedores se crean desde imágenes de contenedor.

**TODO** EL SOFTWARE A DIA DE HOY SE DISTRIBUYE MEDIANTE IMAGENES DE CONTENEDOR
--------

## MODELO CLASICO DE INSTALACION DE SOFTWARE

        App 1 + App 2 + App 3       Problemas: 
    ---------------------------         - Incompatibilidades entre librerias / dependencias / configuraciones
        Sistema operativo               - Seguridad
    ---------------------------         - App 1 tiene un BUG ! (100% CPU)   --> OFFLINE... App2 y App3 van detrás !
            HIERRO


## MODELO DE INSTALACION DE SOFTWARE BASADO EN MAQUINAS VIRTUALES

        App 1 | App 2 + App 3       Problemas:
    ---------------------------         - Desperdicio de recursos
        SO 1  |      SO 2               - Merma en el rendimiento
    ---------------------------         - Incremento de complejidad en la instalación / operación / mnto
        MV 1  |      MV 2           
    ---------------------------     
        Hipervisor: HyperV
        Citrix, VMWare, KVM, 
        Virtualbox
    ---------------------------     
        Sistema operativo           
    ---------------------------     
            HIERRO


## MODELO DE INSTALACION DE SOFTWARE BASADO EN CONTENEDORES

        App 1 | App 2 + App 3 
    ---------------------------
        C 1   |      C  2           
    ---------------------------     
      Gestor de contenedores:
      Docker, Podman, CRIO,
      Containerd
    ---------------------------     
      Sistema operativo Linux          
    ---------------------------     
            HIERRO

## Imagénes de contenedor

Es un triste fichero comprimido que lleva un programa YA INSTALADO por alguien... que sabe un huevo... MUCHO 
MAS QUE YO, de instaalr ese programa... habitualmente porque es quién lo ha desarrollado.
Y yo lo descomprimo en mi maquina y lo ejecuto.

Las imágenes de contenedor las encuentro en REGISTRIES DE REPOS DE IMAGENES DE CONTENEDOR:
- Docker hub
- Quay.io       REDHAT (aquí teneis ansible)


Quiero montar Mongo en mi máquina. QUE HAGO?
1º Descargar un instalador
2º Ejecuto el instalador... mirando la docu.. porque voy a tener en paralelo que configurar aquello de alguna forma
3º Ejecuto

c:\Archivos de programa\mongo --> .zip --> email ... Este zip es una imagen de contenedor

