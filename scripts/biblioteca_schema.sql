CREATE TABLE public.autores (
    cod_autor integer NOT NULL,
    nombre_autor character varying(150),
    notas text
);

CREATE TABLE public.dewey (
    cod_dewey character(25) NOT NULL,
    termino_dewey character varying(150)
);

CREATE TABLE public.editoriales (
    cod_editorial smallint NOT NULL,
    nombre_editorial character varying(100)
);

CREATE TABLE public.forma_ingreso (
    cod_forma_ingreso integer NOT NULL,
    forma_ingreso character(25)
);

CREATE TABLE public.funciones (
    cod_funcion smallint NOT NULL,
    funcion character(25)
);

CREATE TABLE public.inventario (
    cod_obra integer,
    cod_registro integer NOT NULL,
    volumen character(25),
    cod_forma_ingreso integer,
    fecha_recepcion date,
    observaciones character varying(100)
);

CREATE TABLE public.obra_autor (
    cod_obra integer NOT NULL,
    cod_autor integer NOT NULL,
    cod_funcion smallint NOT NULL
);


CREATE TABLE public.obra_editorial (
    cod_obra integer NOT NULL,
    cod_editorial smallint NOT NULL
);

CREATE TABLE public.obra_tema (
    cod_obra integer NOT NULL,
    cod_tema integer NOT NULL
);


CREATE TABLE public.obras (
    cod_obra integer NOT NULL,
    titulo character varying(500),
    ubicacion character varying(30),
    edicion character varying(100),
    pais character(3),
    fecha character(10),
    paginacion character(20),
    serie character varying(100),
    notas text,
    isbn character(20),
    cod_dewey character(25),
    supervisada smallint
);

CREATE TABLE public.paises (
    cod_pais character(3) NOT NULL,
    nombre_pais character varying(50)
);


CREATE TABLE public.temas (
    cod_tema integer NOT NULL,
    tema character varying(300)
);


