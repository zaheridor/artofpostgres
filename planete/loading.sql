begin;

create table archives_planete
(
    IDENTITY                text,
    numero_inventario       text,
    leyenda_original        text,
    leyenda_uneva           text,
    lugar_antiguo           text,
    fecha_rodaje            text,
    operador                text,
    mision                  text,
    localizaciones          text,
    temas                   text,
    sujetos                 text,
    personas                text,
    proceso_tecnico         text,
    formato_original        text,
    membresia_actual        text,
    coleccion               text,
    con_copyright           text,
    continente              text,
    region                  text,
    pais                    text,
    departamento            text,
    ciudad                  text,
    url_imagen              text,
    ubicacion_geografica    text,
    ubicacion_texto         text
);

\copy archives_planete from 'archives-de-la-planete.csv' with delimiter ';' null '' csv header

alter table archives_planete
alter ubicacion_geografica
type point
using point(cast(split_part(ubicacion_geografica, ',', 1) as double precision),cast(split_part(ubicacion_geografica, ',', 2) as double precision));

commit;