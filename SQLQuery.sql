-- creando la base de datos para el proyecto
CREATE DATABASE poo_almacen;

-- creando tablas
CREATE TABLE tipos_cliente(
id integer  not null identity,
nombre varchar(20) not null
)