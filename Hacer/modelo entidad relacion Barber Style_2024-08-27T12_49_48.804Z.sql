CREATE TABLE "Pais" (
	"idPais" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("idPais")
);


CREATE TABLE "Departamento" (
	"idDepartamento" UUID NOT NULL UNIQUE,
	"idPais" UUID,
	"Nombre" VARCHAR,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("idDepartamento")
);


CREATE TABLE "Ciudad" (
	"idCiudad" UUID NOT NULL UNIQUE,
	"idDepartamento" UUID,
	"Nombre" VARCHAR,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("idCiudad")
);


CREATE TABLE "Barberia" (
	"idBarberia" UUID NOT NULL UNIQUE,
	"RazonSocial" VARCHAR,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("idBarberia")
);


CREATE TABLE "Sede" (
	"idSede" UUID NOT NULL UNIQUE,
	"idBarberia" UUID,
	"idCiudad" UUID,
	"Direccion" VARCHAR,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	"NIT" VARCHAR,
	PRIMARY KEY("idSede")
);


CREATE TABLE "Empleado" (
	"idEmpleado" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR,
	"Apellido" VARCHAR,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	"Contraseña" VARCHAR,
	"idSede" UUID,
	PRIMARY KEY("idEmpleado")
);


CREATE TABLE "Cliente" (
	"idCliente" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR,
	"Apellido" VARCHAR,
	"FechaNacimiento" DATE,
	"Telefono" VARCHAR,
	"Correo" VARCHAR,
	"Contraseña" VARCHAR,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("idCliente")
);


CREATE TABLE "Catalogo" (
	"idCatalogo" UUID NOT NULL UNIQUE,
	"Descripción" VARCHAR,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	"idSede" UUID,
	PRIMARY KEY("idCatalogo")
);


CREATE TABLE "Tipo_Servicio" (
	"idTipoServicio" UUID NOT NULL UNIQUE,
	"Descripción" VARCHAR,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	"Valor" DECIMAL,
	PRIMARY KEY("idTipoServicio")
);


CREATE TABLE "Servicio" (
	"idServico" UUID NOT NULL UNIQUE,
	"idTipoServico" UUID,
	"EstadoServicio" BIT,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("idServico")
);


CREATE TABLE "Catalogo_TipoServico" (
	"idCatalogo" UUID NOT NULL UNIQUE,
	"idTipoServicio" UUID,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("idCatalogo")
);


CREATE TABLE "Reserva" (
	"idReserva" UUID NOT NULL UNIQUE,
	"idServicio" UUID,
	"Fecha" TIMESTAMP,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	"idSede" UUID,
	PRIMARY KEY("idReserva")
);


CREATE TABLE "Detalle_Reserva" (
	"idDetalleReserva" UUID NOT NULL UNIQUE,
	"DetalleReserva" VARCHAR,
	"idCliente" UUID,
	"idEmpleado" UUID,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	"idEstadoReserva" UUID,
	PRIMARY KEY("idDetalleReserva")
);


CREATE TABLE "EstadoReserva" (
	"idEstadoReserva" UUID NOT NULL UNIQUE,
	"EstadoServico" VARCHAR,
	"Activo" BIT,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("idEstadoReserva")
);


ALTER TABLE "Departamento"
ADD FOREIGN KEY("idDepartamento") REFERENCES "Ciudad"("idDepartamento")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Pais"
ADD FOREIGN KEY("idPais") REFERENCES "Departamento"("idPais")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Barberia"
ADD FOREIGN KEY("idBarberia") REFERENCES "Sede"("idBarberia")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Ciudad"
ADD FOREIGN KEY("idCiudad") REFERENCES "Sede"("idCiudad")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Sede"
ADD FOREIGN KEY("idSede") REFERENCES "Empleado"("idSede")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Sede"
ADD FOREIGN KEY("idSede") REFERENCES "Catalogo"("idSede")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Catalogo"
ADD FOREIGN KEY("idCatalogo") REFERENCES "Catalogo_TipoServico"("idCatalogo")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Tipo_Servicio"
ADD FOREIGN KEY("idTipoServicio") REFERENCES "Catalogo_TipoServico"("idTipoServicio")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Tipo_Servicio"
ADD FOREIGN KEY("idTipoServicio") REFERENCES "Servicio"("idTipoServico")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Servicio"
ADD FOREIGN KEY("idServico") REFERENCES "Reserva"("idReserva")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Cliente"
ADD FOREIGN KEY("idCliente") REFERENCES "Detalle_Reserva"("idCliente")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Empleado"
ADD FOREIGN KEY("idEmpleado") REFERENCES "Detalle_Reserva"("idEmpleado")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Detalle_Reserva"
ADD FOREIGN KEY("idEstadoReserva") REFERENCES "EstadoReserva"("idEstadoReserva")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Sede"
ADD FOREIGN KEY("idSede") REFERENCES "Reserva"("idSede")
ON UPDATE NO ACTION ON DELETE NO ACTION;