# Comandos en Slime: #

## Cargar librerías por quickload antes de compilar: ##
`
(ql:quickload "postmodern")
(ql:quickload :cxml)
(ql:quickload :local-time)
`

## Compilar código LISP ##
^c ^k

## Ejecución ##
### Cargar package: ###
`(in-package shakes)`

### Ejecutar programa (ruta absoluta): ###
`(parse-document "/path/to/dream.xml")`
`(insert-visitors 1001 100000)`

## Alternativa ejecución ##
`(shakes::parse-document "/path/to/dream.xml")`
`(shakes::insert-visitors 1001 100000)`
