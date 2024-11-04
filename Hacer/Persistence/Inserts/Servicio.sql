-- Inserción de datos en la tabla Servicio
INSERT INTO Servicio (idServicio, idTipoServicio, idBarbero, EstadoServicio) VALUES
(uuid_generate_v4(), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Corte Hombre'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Juan'), 'En Proceso'),
(uuid_generate_v4(), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Corte Mujer'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Carlos'), 'Completado'),
(uuid_generate_v4(), (SELECT idTipoServicio FROM Tipo_Servicio WHERE Descripcion = 'Afeitado'), (SELECT idBarbero FROM Barbero WHERE Nombre = 'Luis'), 'Pendiente');
