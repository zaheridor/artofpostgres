# Comandos en Slime: #

## Cargar librerías por quickload: ##
`
(ql:quickload "postmodern")
(ql:quickload :cxml)
`

## Compilar código LISP ##
^c ^k

## Ejecución ##
### Cargar package: ###
`(in-package shakes)`

### Ejecutar programa (ruta absoluta): ###
`(parse-document "/path/to/dream.xml")`

## Alternativa ejecución ##
`(shakes::parse-document "/path/to/dream.xml")`