# REGEX

Las expresiones regulares se basan en la definición de patrones.

Un patrón es un conjunto de subpatrones.

Un subpatrón es:
- Una secuencia de caracteres
- Seguida de un modificador de ocurrencia

## Secuencias de caracteres

| secuencia de caracteres   | significado de la secuencia | regla     |   texto           | valida    |
| ------------------------- | --------------------------- | :-------: | ----------------- | :-------: |
| hola                      | literalmente esa secuencia  | empieza   | **hola** lucas    |    √      |
| hola                      |                             | contiene  | **hola** lucas    |    √      |
| hola                      |                             | acaba por | hola lucas        |    x      |
| [hola]                    | alguno <br>de esos caracteres  | contiene | **h** **o** **l** **a** **l** uc **a** s        |    √      |
| [a-z]                     | algun caracter de la a a la z | contiene | **t** **e** **n** **g** **o** 33 **a** ñ **o** **s**    |    √      |
| [a-zA-Zñ]                 | algun caracter de la a a la z <br/> de la Z a la Z o la ñ | | | | 
| [0-9]                     | caracteres del 0 al 9 | | | | 
| [0-59]                    | caracteres del 0 al 5 o el 9 | | | | 
| .                         | cualquier caracter | | | | 
| \.    [.]                 | el punto | | | | 

## Modificadores de ocurrencia

| Modificador | Significado                                 |
| ----------- | ------------------------------------------- |
|             | La secuencia anterior debe aparecer 1 vez   |
| ?           | Puede aparecer o no                         |
| +           | Debe aparecer al menos 1 vez                |
| *           | Puede no aparecer o hacerlo muchas veces    |
| {3}         | Debe aparecer 3 veces                       |
| {3,6}       | Debe aparecer de 3 a 6 veces                |
| {3,}        | Debe aparecer al menos 3 veces              |

# Caracteres especiales
| caracter.   | Significado      |
| ----------- | ---------------- |
| \|          | O                |
| ^           | Comienza por     |
| $           | Acaba por        |
| ()          | Hacen agrupaciones |

Para trabajar con expresiones regular... buscar una página tipo regex101.com
