-- Inserción de datos en la tabla Pais
INSERT INTO Pais (idPais, Nombre) VALUES
(uuid_generate_v4(), 'Colombia'),
(uuid_generate_v4(), 'Argentina'),
(uuid_generate_v4(), 'México');

-- Inserción de datos en la tabla Departamento
INSERT INTO Departamento (idDepartamento, idPais, Nombre) VALUES
(uuid_generate_v4(), (SELECT idPais FROM Pais WHERE Nombre = 'Colombia'), 'Antioquia'),
(uuid_generate_v4(), (SELECT idPais FROM Pais WHERE Nombre = 'Argentina'), 'Buenos Aires'),
(uuid_generate_v4(), (SELECT idPais FROM Pais WHERE Nombre = 'México'), 'Jalisco');

-- Inserción de datos en la tabla Ciudad
INSERT INTO Ciudad (idCiudad, idDepartamento, Nombre) VALUES
(uuid_generate_v4(), (SELECT idDepartamento FROM Departamento WHERE Nombre = 'Antioquia'), 'Medellín'),
(uuid_generate_v4(), (SELECT idDepartamento FROM Departamento WHERE Nombre = 'Buenos Aires'), 'La Plata'),
(uuid_generate_v4(), (SELECT idDepartamento FROM Departamento WHERE Nombre = 'Jalisco'), 'Guadalajara');

-- Inserción de datos en la tabla Sede
INSERT INTO Sede (idSede, idCiudad, Direccion, NIT) VALUES
(uuid_generate_v4(), (SELECT idCiudad FROM Ciudad WHERE Nombre = 'Medellín'), 'Calle 123', '900123456'),
(uuid_generate_v4(), (SELECT idCiudad FROM Ciudad WHERE Nombre = 'La Plata'), 'Avenida 45', '900654321'),
(uuid_generate_v4(), (SELECT idCiudad FROM Ciudad WHERE Nombre = 'Guadalajara'), 'Calle Revolución', '900987654');

-- Inserción de datos en la tabla Barbero
INSERT INTO Barbero (idBarbero, Nombre, Apellido, idSede) VALUES
(uuid_generate_v4(), 'Juan', 'Pérez', (SELECT idSede FROM Sede WHERE Direccion = 'Calle 123')),
(uuid_generate_v4(), 'Carlos', 'Martínez', (SELECT idSede FROM Sede WHERE Direccion = 'Avenida 45')),
(uuid_generate_v4(), 'Luis', 'González', (SELECT idSede FROM Sede WHERE Direccion = 'Calle Revolución'));

-- Inserción de datos en la tabla Catalogo
INSERT INTO Catalogo (idCatalogo, Descripcion) VALUES
(uuid_generate_v4(), 'Corte de Cabello'),
(uuid_generate_v4(), 'Afeitado'),
(uuid_generate_v4(), 'Tinte de Cabello');

-- Inserción de datos en la tabla Tipo_Servicio
INSERT INTO Tipo_Servicio (idTipoServicio, Descripcion, Valor) VALUES
(uuid_generate_v4(), 'Corte Hombre', 10000),
(uuid_generate_v4(), 'Corte Mujer', 20000),
(uuid_generate_v4(), 'Afeitado', 5000);

-- Inserción de datos en la tabla Catalogo_TipoServicio
INSERT INTO Catalogo_TipoServicio (idCatalogo, idTipoServicio) VALUES
((SELECT idCatalogo FROM Catalogo WHERE Descripcion = 'Corte de Cabello'), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Corte Hombre')),
((SELECT idCatalogo FROM Catalogo WHERE Descripcion = 'Afeitado'), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Afeitado')),
((SELECT idCatalogo FROM Catalogo WHERE Descripcion = 'Corte de Cabello'), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Corte Mujer'));

-- Inserción de datos en la tabla Servicio
INSERT INTO Servicio (idServicio, idTipoServicio, idBarbero, EstadoServicio) VALUES
(uuid_generate_v4(), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Corte Hombre'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Juan'), 'En Proceso'),
(uuid_generate_v4(), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Corte Mujer'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Carlos'), 'Completado'),
(uuid_generate_v4(), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Afeitado'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Luis'), 'Pendiente');

-- Inserción de datos en la tabla Tipo_Documento
INSERT INTO Tipo_Documento (idTipoDocumento, Descripcion) VALUES
(uuid_generate_v4(), 'Cédula'),
(uuid_generate_v4(), 'Pasaporte'),
(uuid_generate_v4(), 'Licencia de Conducir');

-- Inserción de datos en la tabla Tipo_EstadoCivil
INSERT INTO Tipo_EstadoCivil (idTipoEstadoCivil, Descripcion) VALUES
(uuid_generate_v4(), 'Soltero'),
(uuid_generate_v4(), 'Casado'),
(uuid_generate_v4(), 'Divorciado');

-- Inserción de datos en la tabla Tipo_Genero
INSERT INTO Tipo_Genero (idTipoGenero, Descripcion) VALUES
(uuid_generate_v4(), 'Masculino'),
(uuid_generate_v4(), 'Femenino'),
(uuid_generate_v4(), 'No Binario');

-- Inserción de datos en la tabla Cliente
INSERT INTO Cliente (idCliente, Nombre, Apellido, FechaNacimiento, Correo, idTipoDocumento, idTipoEstadoCivil, idTipoGenero) VALUES
(uuid_generate_v4(), 'Pedro', 'García', '1990-01-01', 'pedro@gmail.com', (SELECT idTipoDocumento FROM Tipo_Documento WHERE Descripcion = 'Cédula'), (SELECT idTipoEstadoCivil FROM Tipo_EstadoCivil WHERE Descripcion = 'Soltero'), (SELECT idTipoGenero FROM Tipo_Genero WHERE Descripcion = 'Masculino')),
(uuid_generate_v4(), 'Ana', 'Lopez', '1985-05-05', 'ana@gmail.com', (SELECT idTipoDocumento FROM Tipo_Documento WHERE Descripcion = 'Pasaporte'), (SELECT idTipoEstadoCivil FROM Tipo_EstadoCivil WHERE Descripcion = 'Casado'), (SELECT idTipoGenero FROM Tipo_Genero WHERE Descripcion = 'Femenino')),
(uuid_generate_v4(), 'Jorge', 'Martinez', '1975-07-07', 'jorge@gmail.com', (SELECT idTipoDocumento FROM Tipo_Documento WHERE Descripcion = 'Licencia de Conducir'), (SELECT idTipoEstadoCivil FROM Tipo_EstadoCivil WHERE Descripcion = 'Divorciado'), (SELECT idTipoGenero FROM Tipo_Genero WHERE Descripcion = 'Masculino'));

-- Inserción de datos en la tabla Reserva
INSERT INTO Reserva (idReserva, idServicio, Fecha, idCliente, idSede, idEmpleado) VALUES
(uuid_generate_v4(), (SELECT idServicio FROM Servicio WHERE EstadoServicio = 'En Proceso'), '2023-10-01 10:00:00', (SELECT idCliente FROM Cliente WHERE Nombre = 'Pedro'), (SELECT idSede FROM Sede WHERE Direccion = 'Calle 123'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Juan')),
(uuid_generate_v4(), (SELECT idServicio FROM Servicio WHERE EstadoServicio = 'Completado'), '2023-10-02 11:00:00', (SELECT idCliente FROM Cliente WHERE Nombre = 'Ana'), (SELECT idSede FROM Sede WHERE Direccion = 'Avenida 45'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Carlos')),
(uuid_generate_v4(), (SELECT idServicio FROM Servicio WHERE EstadoServicio = 'Pendiente'), '2023-10-03 12:00:00', (SELECT idCliente FROM Cliente WHERE Nombre = 'Jorge'), (SELECT idSede FROM Sede WHERE Direccion = 'Calle Revolución'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Luis'));

-- Inserción de datos en la tabla EstadoReserva
INSERT INTO EstadoReserva (idEstadoReserva, Estado) VALUES
(uuid_generate_v4(), 'Pendiente'),
(uuid_generate_v4(), 'Completado'),
(uuid_generate_v4(), 'Cancelado');

-- Inserción de datos en la tabla Detalle_Reserva
INSERT INTO Detalle_Reserva (idDetalleReserva, idReserva, idEstadoReserva) VALUES
(uuid_generate_v4(), (SELECT idReserva FROM Reserva WHERE idCliente = (SELECT idCliente FROM Cliente WHERE Nombre = 'Pedro')), (SELECT idEstadoReserva FROM EstadoReserva WHERE Estado = 'Pendiente')),
(uuid_generate_v4(), (SELECT idReserva FROM Reserva WHERE idCliente = (SELECT idCliente FROM Cliente WHERE Nombre = 'Ana')), (SELECT idEstadoReserva FROM EstadoReserva WHERE Estado = 'Completado')),
(uuid_generate_v4(), (SELECT idReserva FROM Reserva WHERE idCliente = (SELECT idCliente FROM Cliente WHERE Nombre = 'Jorge')), (SELECT idEstadoReserva FROM EstadoReserva WHERE Estado = 'Pendiente'));
