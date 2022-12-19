Al crear máquinas en un cloud, si son Linux...

Nos comentamos mediante ssh... y qué suministramos al conectarnos? Credenciales:
- usuario
- contraseña... Par de claves pública / privada
    - Al momento de contectarnos suministramos a ssh la clave privada...
    - La publica hay que haberla depositado previamente en el servidor -> ~/.ssh/authorized_keys

# Queremos un módulo que:
- Genere un par de claves ssh... y de ellas:
    - 4 ficheros:
        - Publica: publicKey.pem publicKey.openssh   
        - Privada: privateKey.pem privateKey.openssh   
    - Además, las queremos como outputs... Los 4 datos

Siempre queremos generar claves nuevas ssh?
El módulo debe hacer lo anterior siempre que:
- Los fichero no existan
- Aún existiendo los ficheros, se configure una variable `force_generate`a true

El directorio de los ficheros debe ser personalizable (variable) `keys_path`
Vamos a parametrizar también el algoritmo y su configuración.
`algorithm`
    `name`
    `config`

