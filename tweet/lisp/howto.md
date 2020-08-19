# Comandos en Slime: #

## Cargar librerías por quickload: ##
`
(ql:quickload "postmodern")
(ql:quickload :cxml)
(ql:quickload :yason)
(ql:quickload :zip)
`
## Cargar package: ##
`(in-package shakes)`

## Ejecutar programa: ##
`(parse-document "dream.xml")`